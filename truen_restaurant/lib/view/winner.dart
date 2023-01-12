import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/home.dart';

import '../controller/home_controller.dart';

class Winner extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  Winner({Key? key}) : super(key: key);

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
                      'assets/images/${homeController.semiFinals[homeController.firstIndex]}.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                    onTap: () {
                      print(homeController.semiFinals);
                      homeController.topTappedSemi();
                    },
                  ),
                  InkWell(
                    child: Image.asset(
                      'assets/images/${homeController.semiFinals[homeController.secondIndex]}.jpg',
                      fit: BoxFit.cover,
                      width: 300,
                    ),
                    onTap: () {
                      homeController.bottomTappedSemi();
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
