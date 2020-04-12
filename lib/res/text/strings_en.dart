import 'dart:ui';

import 'package:timeago/timeago.dart' as timeago;

import 'strings_base.dart';

class StringsEn implements StringsBase {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => "Coronavirus Stats";

  String updated_x_min_ago(DateTime time) => "Updated ${timeago.format(time)}";

  String get active => "Active";

  String get confirmed => "Confirmed";

  String get critical => "Critical";

  String get deceased => "Deceased";

  String get recovered => "Recovered";
}
