import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/home.dart';

import '../controller/home_controller.dart';

class WorldCup extends StatelessWidget {
  final homeController = Get.find<HomeController>();

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
                    'assets/images/${homeController.randomList[homeController.firstIndex]}.jpg',
                    fit: BoxFit.cover,
                    width: 300,
                  ),
                  onTap: () {
                    print(homeController.randomList);
                    homeController.topTappedQuarter();
                  },
                ),
                InkWell(
                  child: Image.asset(
                    'assets/images/${homeController.randomList[homeController.secondIndex]}.jpg',
                    fit: BoxFit.cover,
                    width: 300,
                  ),
                  onTap: () {
                    homeController.bottomTappedQuarter();
                  },
                ),
                homeController.quarterFinish == true?
                    ElevatedButton(onPressed: (){
                      Get.toNamed('/semi');
                    },
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
