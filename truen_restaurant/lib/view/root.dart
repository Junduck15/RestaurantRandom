import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/controller/home_controller.dart';
import 'package:truen_restaurant/home.dart';
import 'package:truen_restaurant/view/splash_screen.dart';

class Root extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx((){
        if (homeController.isReady.value == true) {
          return Home();
        } else {
          return SplashScreen();
        }

      }
    );

  }
}
