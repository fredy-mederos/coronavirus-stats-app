import 'package:coronavirus_stats_app/domain/usecases/get_countries_usecase.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_global_stats_usecase.dart';
import 'package:coronavirus_stats_app/domain/usecases/sort_countries_usecase.dart';
import 'package:coronavirus_stats_app/impl/sort_countries_usecase_impl.dart';
import 'package:coronavirus_stats_app/impl/stub/get_countries_usecase_stub_impl.dart';
import 'package:coronavirus_stats_app/impl/stub/get_global_stats_usecase_stub_impl.dart';
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
  Client _client;

  Client get client => _client;

  ///Is the app in debug mode?
  bool isInDebugMode() {
    var debugMode = false;
    assert(debugMode = true);
    return debugMode;
  }

  T getDependency<T>() => getIt.get();

  static init({@required Mode mode, @required Client client, @required String apiUrl}) {
    instance ??= MainComponent._start(mode: mode, client: client, apiUrl: apiUrl);
  }

  MainComponent._start({@required Mode mode, @required Client client, @required String apiUrl}) {
    this._apiUrl = apiUrl;
    this._client = client;
    _registerDependencies(mode: mode);
  }

  void _registerDependencies({Mode mode}) {
    _registerViewModels();
    _registerCommon();

    if (mode == Mode.STUB) _registerStubImpl();
  }

  void _registerStubImpl() {
    getIt.registerFactory<GetGlobalStatsUseCase>(() => GetGlobalStatsUseCaseStubImpl());
    getIt.registerFactory<GetCountriesUseCase>(() => GetCountriesUseCaseStubImpl());
  }

  void _registerViewModels() {
    getIt.registerFactory<HomeViewModel>(() => HomeViewModel(
          getDependency(),
          getDependency(),
          getDependency(),
        ));
  }

  void _registerCommon() {
    if (isInDebugMode()) {
      getIt.registerFactory<Logger>(() => LoggerImpl());
    } else {
      getIt.registerFactory<Logger>(() => LoggerEmptyImpl());
    }
    getIt.registerFactory(() => NetworkHandler(_apiUrl, getDependency()));
    getIt.registerFactory<SortCountriesUseCase>(() => SortCountriesUseCaseImpl());
  }
}

enum Mode { STUB, PROD }
enum Client { WEB, MOBILE }
