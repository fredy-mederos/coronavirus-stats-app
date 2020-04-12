import 'package:coronavirus_stats_app/ui/home/home_viewmodel.dart';
import 'package:coronavirus_stats_app/utils/logger.dart';
import 'package:coronavirus_stats_app/utils/network_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class MainComponent {
  ///Singleton instance
  static MainComponent instance;
  final getIt = GetIt.instance;
  String _apiUrl;

  ///Is the app in debug mode?
  bool isInDebugMode() {
    var debugMode = false;
    assert(debugMode = true);
    return debugMode;
  }

  T getDependency<T>() => getIt.get();

  static init({@required Mode mode, @required String apiUrl}) {
    instance ??= MainComponent._start(mode: mode, apiUrl: apiUrl);
  }

  MainComponent._start({@required Mode mode, @required String apiUrl}) {
    this._apiUrl = apiUrl;
    _registerDependencies(mode: mode);
  }

  void _registerDependencies({Mode mode}) {
    _registerViewModels();
    _registerCommon();
  }

  void _registerViewModels() {
    getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  }

  void _registerCommon() {
    if (isInDebugMode()) {
      getIt.registerFactory<Logger>(() => LoggerImpl());
    } else {
      getIt.registerFactory<Logger>(() => LoggerEmptyImpl());
    }
    getIt.registerFactory(() => NetworkHandler(_apiUrl, getDependency()));
  }
}

enum Mode { STUB, PROD }
