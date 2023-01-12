import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/controller/home_controller.dart';
import 'package:truen_restaurant/home.dart';
import 'package:truen_restaurant/view/splash_screen.dart';

class Root extends StatelessWidget {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Home(),
          homeController.isReady.value == false
              ? const CommonLoading()
              : const SizedBox.shrink()
        ],
      );
    });
  }
}

class CommonLoading extends StatelessWidget {
  final String? _content;
  final Color backgroundColor;

  const CommonLoading({
    Key? key,
    String? content,
    this.backgroundColor = Colors.black26,
  })  : _content = content,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = _content;
    if (content != null) {
      return Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.blue),
              const SizedBox(height: 24),
              DefaultTextStyle(
                style: const TextStyle(fontSize: 14, color: Colors.blue),
                child: Text(content),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.blue),
      );
    }
  }
}
