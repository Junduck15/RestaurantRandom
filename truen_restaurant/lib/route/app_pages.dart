import 'package:get/get.dart';
import 'package:truen_restaurant/binding/main_binding.dart';
import 'package:truen_restaurant/home.dart';
import 'package:truen_restaurant/view/add_menu_page.dart';
import 'package:truen_restaurant/view/root.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.initial;
  static final routes = [
    GetPage(
        name: Routes.initial,
        page: () => Root(),
        binding: MainBindings(),
        children: [
          GetPage(
              name: Routes.HOME,
              binding: MainBindings(),
              page: () => Home(),
              transition: Transition.fadeIn),
          GetPage(

              name: Routes.add,
              binding: MainBindings(),
              page: () => Add(),
              transition: Transition.fadeIn),
        ])
  ];
}
