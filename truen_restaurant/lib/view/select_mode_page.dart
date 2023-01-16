import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/theme_controller.dart';

class SelectMode extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('점심 메뉴 추천'),
        actions: [
          GetBuilder<ThemeController>(builder: (controller) {
            return IconButton(
              icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                themeController.changeTheme();
              },
            );
          }),
        ],
      ),
      body: GetBuilder<ThemeController>(builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    Get.isDarkMode
                        ? 'assets/images/vs2.png'
                        : 'assets/images/vsDark.png',
                    width: 350,
                  ),
                  Positioned(
                    left: 40,
                    top: 40,
                    child: Text("원판 돌리기",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  Positioned(
                    left: 40,
                    top: 100,
                    child: Text("랜덤으로 메뉴 정하기", style: TextStyle(fontSize: 12)),
                  ),
                  Positioned(
                    top: 170,
                    left: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/root');
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(child: const Text('시작하기')),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Stack(
                children: [
                  Image.asset(
                    Get.isDarkMode
                        ? 'assets/images/wheel2.png'
                        : 'assets/images/wheelDark.png',
                    width: 350,
                  ),
                  const Positioned(
                    left: 40,
                    top: 40,
                    child: Text("메뉴 월드컵",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  const Positioned(
                    left: 40,
                    top: 100,
                    child: Text("임의로 메뉴 정하기", style: TextStyle(fontSize: 12)),
                  ),
                  Positioned(
                    top: 170,
                    left: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed('/select');
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(child: const Text('시작하기')),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
