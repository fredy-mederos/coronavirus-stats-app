export 'package:coronavirus_stats_app/utils/extensions.dart';

abstract class BaseViewModel {
  ///Be sure to override this function and dispose all streams
  void dispose();
}
