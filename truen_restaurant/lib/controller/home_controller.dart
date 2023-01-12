import 'dart:async';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

import 'package:get/get.dart';
import 'package:truen_restaurant/model/restaurant_model.dart';
import 'package:truen_restaurant/repository/restaurant_repository.dart';

import '../repository/restaurant_repository.dart';

class HomeController extends GetxController {
  StreamController<int> selected = StreamController<int>();
  int temp = 0;
  final List<RestaurantModel> restItems = RestaurantRepository().restaurantList;
  final List<RestaurantModel> selectedItems = [];
  int wheelDuration = 0;
  bool isSaved = false;
  onInit() {
    super.onInit();
    for (int i = 0; i < restItems.length; i++) {
      if (restItems[i].isChecked == true) {
        selectedItems.add(restItems[i]);
      }
    }
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
    update();
  }

  wheelDurationChange(dur) {
    wheelDuration = dur;
    update();
  }
}
