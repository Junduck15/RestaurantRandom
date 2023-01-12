import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/controller/home_controller.dart';
import 'package:truen_restaurant/home.dart';
import 'package:truen_restaurant/view/splash_screen.dart';

import '../util/common_loading.dart';

class Root extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Home(),
          homeController.isReady.value == false
              ? const CommonLoading()
              : const SizedBox.shrink()
        ],
      );
    });
  }
}



