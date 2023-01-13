import 'package:get/get.dart';
import 'package:truen_restaurant/controller/home_controller.dart';
import 'package:truen_restaurant/controller/theme_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ThemeController());
  }
}
