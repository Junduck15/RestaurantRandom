part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const initial = _Paths.inital;
  static const HOME = '/home';
  static const ROOT = '/root';
  static const add = _Paths.ADD;
}

abstract class _Paths {
  static const inital = '/';
  static const ROOT = '/root';
  static const ADD = '/add';
}
