import 'package:flutter/widgets.dart';

import 'text/custom_localizations_delegate.dart';
import 'text/strings_base.dart';

const int _BIG_WIDTH_SIZE = 600;
const int _SMALL_HEIGHT_SIZE = 400;

class R {
  static StringsBase get string => CustomLocalizationsDelegate.stringsBase;

  static bool deviceWidthIsBig(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.width;
    return shortestSide >= _BIG_WIDTH_SIZE;
  }

  static bool deviceHeightIsSmall(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.height;
    return shortestSide < _SMALL_HEIGHT_SIZE;
  }
}
