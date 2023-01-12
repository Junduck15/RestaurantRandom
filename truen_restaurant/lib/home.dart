import 'dart:async';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:truen_restaurant/controller/home_controller.dart';

class Home extends StatelessWidget {
  var width = Get.context!.mediaQuerySize.width;
  var height = Get.context!.mediaQuerySize.height;
  final homeController = Get.find<HomeController>();
  var context = Get.context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('원판에 메뉴 추가'),
              leading: Icon(Icons.add),
              onTap: () {
                homeController.wheelDurationChange(0);
                Get.toNamed('/add');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('식당 랜덤 추천'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            GetBuilder<HomeController>(builder: (context) {
              return homeController.selectedItems.length > 1
                  ? Container(
                      width: 350,
                      height: 350,
                      color: Colors.white,
                      child: Stack(children: [
                        FortuneWheel(
                          duration:
                              Duration(seconds: homeController.wheelDuration),
                          animateFirst: false,
                          selected: homeController.selected.stream,
                          // physics: CircularPanPhysics(
                          //   duration: Duration(seconds: 2),
                          //   curve: Curves.decelerate,
                          // ),
                          //   onFling: () {
                          //     homeController.selected.add(1);
                          //   },1
                          items: [
                            for (var it in homeController.selectedItems)
                              FortuneItem(child: Text(it.name!)),
                          ],
                        ),
                      ]))
                  : Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Text('원판에 추가 할 메뉴를 좌측 옵션을 통해 2개 이상의 메뉴를 고르세요',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center),
                      )));
              ;
            }),
            SizedBox(height: 20),
            // Make a button with a text label.
            GetBuilder<HomeController>(builder: (controller) {
              return ElevatedButton(
                onPressed: () async {
                  homeController.isButtonPressed == true
                      ? null
                      : buttonPressed();
                },
                style: ElevatedButton.styleFrom(
                  primary: homeController.selectedItems.length > 1
                      ? Colors.lightBlueAccent
                      : Colors.grey,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(homeController.selectedItems.length > 1
                    ? '원판돌리기'
                    : '원판이 비었어요'),
              );
            }),
          ],
        ),
      ),
    );
  }

  buttonPressed() async {
    homeController.buttonSwitch();
    await homeController.wheelDurationChange(5);
    homeController.addFortune();
    await Future.delayed(Duration(seconds: 5));
    homeController.buttonSwitch();
    Get.dialog(Dialog(
      child: Container(
        height: 350,
        child: Column(
          children: [
            Text(
                '추천 식당: ${homeController.selectedItems[homeController.temp].name}'),
            Text(
                '회사로부터 거리: ${homeController.selectedItems[homeController.temp].distance}m'),
            Image(
              width: 250,
              height: 250,
              image: AssetImage(
                'assets/images/${homeController.selectedItems[homeController.temp].image}',
              ),
            ),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('확인'),
            )
          ],
        ),
      ),
    ));
  }
}
