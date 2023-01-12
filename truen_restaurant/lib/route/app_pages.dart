import 'package:get/get.dart';
import 'package:truen_restaurant/binding/main_binding.dart';
import 'package:truen_restaurant/home.dart';
import 'package:truen_restaurant/view/add_menu_page.dart';
import 'package:truen_restaurant/view/root.dart';
import 'package:truen_restaurant/view/select_mode_page.dart';
import 'package:truen_restaurant/view/semi_final_page.dart';
import 'package:truen_restaurant/view/winner.dart';
import 'package:truen_restaurant/view/worldcup_page.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.initial;
  static final routes = [
    GetPage(
        name: Routes.initial,
        page: () => SelectMode(),
        binding: MainBindings(),
        children: [
          GetPage(
              name: Routes.HOME,
              binding: MainBindings(),
              page: () => Home(),
              transition: Transition.fadeIn),
          GetPage(
              name: Routes.ROOT,
              binding: MainBindings(),
              page: () => Root(),
              transition: Transition.fadeIn),
          GetPage(

              name: Routes.add,
              binding: MainBindings(),
              page: () => Add(),
              transition: Transition.fadeIn),
          GetPage(

              name: Routes.select,
              binding: MainBindings(),
              page: () => WorldCup(),
              transition: Transition.fadeIn),
          GetPage(

              name: Routes.semi,
              binding: MainBindings(),
              page: () => SemiFinal(),
              transition: Transition.fadeIn),
          GetPage(

              name: Routes.finals,
              binding: MainBindings(),
              page: () => WorldCup(),
              transition: Transition.fadeIn),
          GetPage(

              name: Routes.winner,
              binding: MainBindings(),
              page: () => Winner(),
              transition: Transition.fadeIn),
        ])
  ];
}
