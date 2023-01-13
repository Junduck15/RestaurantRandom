import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truen_restaurant/route/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
