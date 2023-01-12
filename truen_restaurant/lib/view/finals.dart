import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/home.dart';

import '../controller/home_controller.dart';

class Finals extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  Finals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<HomeController>(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Two images in the column

                  InkWell(
                    child: Image.asset(
                      'assets/images/${homeController.finals[homeController.firstIndex]}.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                    onTap: () {
                      homeController.topTappedFinals();
                      Get.toNamed('/winner');
                    },
                  ),
                  InkWell(
                    child: Image.asset(
                      'assets/images/${homeController.finals[homeController.secondIndex]}.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                    onTap: () {
                      homeController.bottomTappedFinals();
                      Get.toNamed('/winner');
                    },
                  ),
                  homeController.semiFinalFinish == true?
                  ElevatedButton(onPressed: (){},
                      child: Text('다음 라운드')):
                  SizedBox.shrink(),

                ],
              );
            }
        ),
      ),
    );
  }
}
