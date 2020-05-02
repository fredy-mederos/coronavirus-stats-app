import 'package:coronavirus_stats_app/domain/models/country_model.dart';
import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_countries_usecase.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_global_stats_usecase.dart';
import 'package:coronavirus_stats_app/domain/usecases/sort_countries_usecase.dart';
import 'package:coronavirus_stats_app/ui/base/loading_viewmodel.dart';
import 'package:coronavirus_stats_app/viewmodel/base_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

class HomeViewModel with LoadingViewModel implements BaseViewModel {
  final GetGlobalStatsUseCase _getGlobalStatsUseCase;
  final GetCountriesUseCase _getCountriesUseCase;
  final SortCountriesUseCase _sortCountriesUseCase;
  SortColumn _sortColumn = SortColumn.TOTAL_CASES;
  bool _sortAscending = false;

  HomeViewModel(this._getGlobalStatsUseCase, this._getCountriesUseCase, this._sortCountriesUseCase);

  BehaviorSubject<StatsModel> _globalStatsSubject = BehaviorSubject();
  BehaviorSubject<CountryDataList> _countriesStatsSubject = BehaviorSubject();

  Stream<StatsModel> get globalStatsStream => _globalStatsSubject.stream;

  Stream<CountryDataList> get countriesStatsStream => _countriesStatsSubject.stream;

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
      _sortCountries(countries, _sortColumn, _sortAscending);
    } catch (ex) {}
    isLoading = false;
  }

  void _sortCountries(List<CountryModel> items, SortColumn sortColumn, bool sortAscending) {
    final sortedItems = _sortCountriesUseCase.sortCountries(items, sortColumn, sortAscending);
    _countriesStatsSubject.sinkAddSafe(CountryDataList(
      list: sortedItems,
      sortAscending: _sortAscending,
      sortColumnIndex: _columnIndex(sortColumn),
    ));
  }

  void sortItems(int columnIndex, bool ascending) {
    _sortColumn = _columnFromIndex(columnIndex);
    _sortAscending = ascending;
    _sortCountries(_countriesStatsSubject.value.list, _sortColumn, _sortAscending);
  }

  int _columnIndex(SortColumn column) {
    switch (column) {
      case SortColumn.TOTAL_CASES:
        return 1;
      case SortColumn.NEW_CASES:
        return 2;
      case SortColumn.TOTAL_DEATHS:
        return 3;
      case SortColumn.NEW_DEATHS:
        return 4;
      case SortColumn.TOTAL_RECOVERED:
        return 5;
      case SortColumn.NEW_RECOVERED:
        return 6;
      case SortColumn.TOTAL_ACTIVE:
        return 7;
      case SortColumn.TOTAL_CRITICAL:
        return 8;
    }
    return -1;
  }

  SortColumn _columnFromIndex(int index) {
    switch (index) {
      case 1:
        return SortColumn.TOTAL_CASES;
      case 2:
        return SortColumn.NEW_CASES;
      case 3:
        return SortColumn.TOTAL_DEATHS;
      case 4:
        return SortColumn.NEW_DEATHS;
      case 5:
        return SortColumn.TOTAL_RECOVERED;
      case 6:
        return SortColumn.NEW_RECOVERED;
      case 7:
        return SortColumn.TOTAL_ACTIVE;
      case 8:
        return SortColumn.TOTAL_CRITICAL;
    }
    return SortColumn.TOTAL_CASES;
  }

  @override
  void dispose() {
    disposeLoadingViewModel();
    _globalStatsSubject.close();
    _countriesStatsSubject.close();
  }
}

class CountryDataList {
  final List<CountryModel> list;
  final bool sortAscending;
  final int sortColumnIndex;

  CountryDataList({
    @required this.list,
    @required this.sortAscending,
    @required this.sortColumnIndex,
  });
}
