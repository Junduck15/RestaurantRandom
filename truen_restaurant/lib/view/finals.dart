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
      appBar: AppBar(
        title: Text('결승'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GetBuilder<HomeController>(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Two images in the column
                  Text('${homeController.restItems[homeController.finals[homeController.firstIndex]-1].name}', style: TextStyle(fontSize: 25)),

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
                  Text('${homeController.restItems[homeController.finals[homeController.secondIndex]-1].name}', style: TextStyle(fontSize: 25)),

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

                ],
              );
            }
        ),
      ),
    );
  }
}
