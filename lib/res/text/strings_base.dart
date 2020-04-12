import 'package:flutter/widgets.dart';

abstract class StringsBase implements WidgetsLocalizations {
  String get appName;
  String get confirmed;
  String get active;
  String get recovered;
  String get critical;
  String get deceased;

  String updated_x_min_ago(DateTime time);
}
