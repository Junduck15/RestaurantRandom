import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/home.dart';

import '../controller/home_controller.dart';

class WorldCup extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('8강'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GetBuilder<HomeController>(
          builder: (context) {
            return
              homeController.quarterFinish == false?
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               // Two images in the column
                Text('${homeController.restItems[homeController.randomList[homeController.firstIndex]-1].name}', style: TextStyle(fontSize: 25),),

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
                Text('${homeController.restItems[homeController.randomList[homeController.secondIndex]-1].name}', style: TextStyle(fontSize: 25)),

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


              ],
            ):
              ElevatedButton(onPressed: (){
                Get.toNamed('/semi');
              },
                  child: Text('다음 라운드'));
          }
        ),
      ),
    );
  }
}
