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
        child: GetBuilder<HomeController>(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Two images in the column
              const Text(
                '우승',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                  '${homeController.restItems[homeController.finals[homeController.winnerIndex] - 1].name}까지의 거리 : '
                  ' ${homeController.restItems[homeController.finals[homeController.winnerIndex] - 1].distance}m.'),
              Image.asset(
                'assets/images/${homeController.finals[homeController.winnerIndex]}.jpg',
                fit: BoxFit.cover,
                width: 300,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('selectMode');
                  },
                  child: const Text('홈으로 돌아가기'))
            ],
          );
        }),
      ),
    );
  }
}
