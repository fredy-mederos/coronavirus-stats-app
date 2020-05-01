import 'package:coronavirus_stats_app/domain/models/country_model.dart';
import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_countries_usecase.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_global_stats_usecase.dart';
import 'package:coronavirus_stats_app/ui/base/loading_viewmodel.dart';
import 'package:coronavirus_stats_app/viewmodel/base_viewmodel.dart';
import 'package:rxdart/subjects.dart';

class HomeViewModel with LoadingViewModel implements BaseViewModel {
  final GetGlobalStatsUseCase _getGlobalStatsUseCase;
  final GetCountriesUseCase _getCountriesUseCase;

  HomeViewModel(this._getGlobalStatsUseCase, this._getCountriesUseCase);

  BehaviorSubject<StatsModel> _globalStatsSubject = BehaviorSubject();
  BehaviorSubject<List<CountryModel>> _countriesStatsSubject = BehaviorSubject();

  Stream<StatsModel> get globalStatsStream => _globalStatsSubject.stream;

  Stream<List<CountryModel>> get countriesStatsStream => _countriesStatsSubject.stream;

  void loadData({bool allowCachedData = true}) async {
    isLoading = true;
    try {
      //in parallel
      final values = await Future.wait([
        _getGlobalStatsUseCase.getGlobalStats(allowCachedData: allowCachedData),
        _getCountriesUseCase.getCountries(allowCachedData: allowCachedData),
      ]);
      final StatsModel stats = values[0];
      final List<CountryModel> countries = values[1];

      _globalStatsSubject.sinkAddSafe(stats);
      _countriesStatsSubject.sinkAddSafe(countries);
    } catch (ex) {}
    isLoading = false;
  }

  @override
  void dispose() {
    disposeLoadingViewModel();
    _globalStatsSubject.close();
    _countriesStatsSubject.close();
  }
}
