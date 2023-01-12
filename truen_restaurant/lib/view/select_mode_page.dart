import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('점심 메뉴 추천'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
                width: 300,
                height: 90,

                padding: EdgeInsets.only(left:30, right: 30),
                child: Row(
                  children: [
                      Image.asset(
                      'assets/images/wheel.png',
                      fit: BoxFit.cover,
                      width: 50,
                    ),
                    const SizedBox(width: 50,),
                    const Text('원판 돌리기'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () {
                Get.toNamed('/select');
              },
              child: Container(
                width: 300,
                height: 80,
                padding: EdgeInsets.only(left:30, right: 30),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/versus.png',
                      fit: BoxFit.cover,
                      width: 50,
                    ),
                    const SizedBox(width: 50,),
                    const Text('메뉴 월드컵'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}