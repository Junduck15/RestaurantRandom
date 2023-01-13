import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/home.dart';

import '../controller/home_controller.dart';

class SemiFinal extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  SemiFinal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('준결승'),
        centerTitle: true,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GetBuilder<HomeController>(builder: (context) {
          return homeController.semiFinalFinish == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Two images in the column
                    Text('${homeController.restItems[homeController.semiFinals[homeController.firstIndex]-1].name}', style: TextStyle(fontSize: 25)),
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
                    Text('${homeController.restItems[homeController.semiFinals[homeController.secondIndex]-1].name}', style: TextStyle(fontSize: 25)),

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
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/finals');
                  },
                  child: Text('다음 라운드'));
        }),
      ),
    );
  }
}
