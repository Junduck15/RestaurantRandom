part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const initial = _Paths.inital;
  static const HOME = '/home';
  static const ROOT = '/root';
  static const add = _Paths.ADD;
  static const select = _Paths.SELECT;
  static const semi = _Paths.SEMI;
  static const finals = _Paths.FINALS;
  static const winner = _Paths.WINNER;

}

abstract class _Paths {
  static const inital = '/';
  static const ROOT = '/root';
  static const ADD = '/add';
  static const SELECT = '/select';
  static const SEMI = '/semi';
  static const FINALS = '/finals';
  static const WINNER = '/winner';
}
