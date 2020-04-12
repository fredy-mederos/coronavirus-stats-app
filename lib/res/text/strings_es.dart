import 'dart:ui';

import 'package:timeago/timeago.dart' as timeago;

import 'strings_base.dart';

class StringsEs implements StringsBase {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => "Coronavirus Stats";

  String updated_x_min_ago(DateTime time) => "Actualizado ${timeago.format(time)}";

  String get active => "Activos";

  String get confirmed => "Confirmados";

  String get critical => "Criticos";

  String get deceased => "Fallecidos";

  String get recovered => "Recuperados";
}
