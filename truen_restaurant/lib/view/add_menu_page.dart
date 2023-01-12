import 'package:flutter/material.dart';
import 'package:truen_restaurant/controller/home_controller.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

class Add extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            homeController.wheelDurationChange(0);
            if (homeController.isSaved == true) {
              Get.back();
              homeController.wheelDurationChange(5);
              Get.back();
            } else {
              Get.defaultDialog(
                title: '저장하지 않았습니다.',
                middleText: '저장하지 않고 나가시겠습니까?',
                textConfirm: '확인',
                confirmTextColor: Colors.white,
                cancelTextColor: Colors.blue,
                buttonColor: Colors.blue,
                onConfirm: () {
                  Get.back();
                  Get.back();
                  homeController.wheelDurationChange(5);
                  Get.back();
                },

              );
            }
          },
        ),
        title: Text('메뉴 추가'),
        actions: [
          GetBuilder<HomeController>(builder: (controller) {
            return ElevatedButton(
              onPressed: () {
                homeController.selectAll();
              },
              child: Text('모두선택'),
            );
          }),
          GetBuilder<HomeController>(builder: (controller) {
            return ElevatedButton(
              onPressed: () async {
                homeController.isSaved = true;
                homeController.saveRestItem();
                homeController.addFortune();
                homeController.wheelDurationChange(0);
              },
              child: Text('저장'),
            );
          }),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: homeController.restItems.length,
          itemBuilder: (context, index) {
            return GetBuilder<HomeController>(builder: (controller) {
              return CheckboxListTile(
                title: Text('${homeController.restItems[index].name}'),
                onChanged: (bool? value) async {
                  await homeController.editRestItem(value, index);
                },
                value: homeController.restItems[index].isChecked,
              );
            });
          },
        ),
      ),
    );
  }
}
