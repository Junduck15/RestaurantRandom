import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import 'package:get/get.dart';
import 'package:truen_restaurant/model/restaurant_model.dart';
import 'package:truen_restaurant/repository/restaurant_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/restaurant_repository.dart';

class HomeController extends GetxController {
  StreamController<int> selected = StreamController<int>();
  int temp = 0;
  final List<RestaurantModel> restItems = RestaurantRepository().restaurantList;
  final List<RestaurantModel> selectedItems = [];
  bool isButtonPressed = false;
  RxBool isReady = false.obs;
  var prefs;

  int wheelDuration = 5;
  bool isSaved = false;

  onInit() async {
    isReady.value = false;
    prefs = await SharedPreferences.getInstance();
    await readFromPref();
    super.onInit();
    for (int i = 0; i < restItems.length; i++) {
      if (restItems[i].isChecked == true) {
        selectedItems.add(restItems[i]);
      }
    }
    await Future.delayed(Duration(seconds: 2), () {
      isReady.value = true;
    });
  }

  readFromPref() async {
    // final List<String>? isCheckedList = prefs.getStringList('restItems');

    final String savedString = prefs.getString('savedString') ?? '';
    final List<String> savedList = savedString.split(',');

    for (int i = 0; i < restItems.length; i++) {
      if (savedList[i] == 'true') {
        restItems[i].isChecked = true;
      }
    }
  }

  editPref() async {
    await prefs.clear();
    String tempString = "";
    for (int i = 0; i < restItems.length; i++) {
      tempString = "$tempString${restItems[i].isChecked},";
    }
    // await prefs.setStringList(
    //     'restItems', restItems.map((e) => e.isChecked.toString()).toList());
    await prefs.setString('savedString', tempString);
  }

  buttonSwitch() {
    isButtonPressed = !isButtonPressed;
    update();
  }

  selectAll() {
    if (selectedItems.length != restItems.length) {
      selectedItems.clear();
      for (int i = 0; i < restItems.length; i++) {
        restItems[i].isChecked = true;
        selectedItems.add(restItems[i]);
      }
    } else {
      for (int i = 0; i < restItems.length; i++) {
        restItems[i].isChecked = false;
      }
      selectedItems.clear();
    }
    update();
  }

  isSelectedEmpty() {
    if (selectedItems.length == 0) {
      return true.obs;
    } else {
      return false.obs;
    }
  }

  addFortune() async {
    temp = Fortune.randomInt(0, selectedItems.length);
    selected.add(temp);
    update();
  }

  editRestItem(value, index) {
    restItems[index].isChecked = value;

    update();
  }

  saveRestItem() {
    selectedItems.clear();

    for (int i = 0; i < restItems.length; i++) {
      if (restItems[i].isChecked == true) {
        selectedItems.add(restItems[i]);
      }
    }
    editPref();
    update();
  }

  wheelDurationChange(dur) {
    wheelDuration = dur;
    update();
  }
}
