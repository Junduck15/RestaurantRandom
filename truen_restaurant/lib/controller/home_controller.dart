import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';

import 'package:get/get.dart';
import 'package:truen_restaurant/model/restaurant_model.dart';
import 'package:truen_restaurant/repository/restaurant_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/restaurant_repository.dart';

class HomeController extends GetxController {
  int temp = 0;
  final List<RestaurantModel> restItems = RestaurantRepository().restaurantList;
  final List<RestaurantModel> selectedItems = [];
  bool isButtonPressed = false;
  RxBool isReady = false.obs;
  int firstIndex = 0;
  int secondIndex = 1;
  bool quarterFinish = false;
  bool semiFinalFinish = false;
  int winnerIndex = 0;
  RxBool isStart = false.obs;
  var prefs;
  List<int> randomList = List.generate(8, (index) => index + 1);
  List<int> semiFinals = [];
  List<int> finals = [];

  int wheelDuration = 5;
  bool isSaved = false;
  StreamController<int> selected = StreamController<int>.broadcast();
  @override
  onInit() async {

    isStart.value = true;
    isReady.value = false;
    randomList.shuffle(Random());
    prefs = await SharedPreferences.getInstance();
    await readFromPref();
    super.onInit();
    for (int i = 0; i < restItems.length; i++) {
      if (restItems[i].isChecked == true) {
        selectedItems.add(restItems[i]);
      }
    }
    await Future.delayed(const Duration(seconds: 2), () {
      isReady.value = true;
    });
  }

  topTappedQuarter() {
    semiFinals.add(randomList[firstIndex]);
    if (firstIndex < 5) {
      firstIndex = firstIndex + 2;
      secondIndex = secondIndex + 2;
    } else {
      quarterFinish = true;
      firstIndex = 0;
      secondIndex = 1;
    }
    update();
  }

  bottomTappedQuarter() {
    semiFinals.add(randomList[secondIndex]);
    if (firstIndex < 5) {
      firstIndex = firstIndex + 2;
      secondIndex = secondIndex + 2;
    } else {
      quarterFinish = true;
      firstIndex = 0;
      secondIndex = 1;
    }
    update();
  }

  topTappedSemi() {
    finals.add(semiFinals[firstIndex]);
    if (firstIndex < 1) {
      firstIndex = firstIndex + 2;
      secondIndex = secondIndex + 2;
    } else {
      firstIndex = 0;
      secondIndex = 1;
      semiFinalFinish = true;
    }
    update();
  }

  bottomTappedSemi() {
    finals.add(semiFinals[secondIndex]);
    if (firstIndex < 1) {
      firstIndex = firstIndex + 2;
      secondIndex = secondIndex + 2;
    } else {
      firstIndex = 0;
      secondIndex = 1;
      semiFinalFinish = true;
    }
    update();
  }

  topTappedFinals() {
    winnerIndex = 0;
    update();
  }

  bottomTappedFinals() {
    winnerIndex = 1;
    update();
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
    isSaved = false;
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
