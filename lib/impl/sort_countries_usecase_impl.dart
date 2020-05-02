import 'package:coronavirus_stats_app/domain/models/country_model.dart';
import 'package:coronavirus_stats_app/domain/usecases/sort_countries_usecase.dart';

class SortCountriesUseCaseImpl implements SortCountriesUseCase {
  @override
  List<CountryModel> sortCountries(List<CountryModel> countries, SortColumn sortColumn, bool ascending) {
    final list = List.of(countries);
    list.sort((c1, c2) {
      switch (sortColumn) {
        case SortColumn.TOTAL_CASES:
          return _compare(c1.stats.cases, c2.stats.cases, ascending);
          break;
        case SortColumn.NEW_CASES:
          return _compare(c1.stats.todayCases, c2.stats.todayCases, ascending);
          break;
        case SortColumn.TOTAL_DEATHS:
          return _compare(c1.stats.deaths, c2.stats.deaths, ascending);
          break;
        case SortColumn.NEW_DEATHS:
          return _compare(c1.stats.todayDeaths, c2.stats.todayDeaths, ascending);
          break;
        case SortColumn.TOTAL_RECOVERED:
          return _compare(c1.stats.recovered, c2.stats.recovered, ascending);
          break;
        case SortColumn.NEW_RECOVERED:
          return _compare(c1.stats.todayRecovered, c2.stats.todayRecovered, ascending);
          break;
        case SortColumn.TOTAL_ACTIVE:
          return _compare(c1.stats.active, c2.stats.active, ascending);
          break;
        case SortColumn.TODAY_ACTIVE:
          return _compare(c1.stats.todayActive, c2.stats.todayActive, ascending);
          break;
        case SortColumn.TOTAL_CRITICAL:
          return _compare(c1.stats.critical, c2.stats.critical, ascending);
          break;
        case SortColumn.TODAY_CRITICAL:
          return _compare(c1.stats.todayCritical, c2.stats.todayCritical, ascending);
          break;
        case SortColumn.TOTAL_TESTS:
          return _compare(c1.stats.tests, c2.stats.tests, ascending);
          break;
      }
      return 0;
    });
    return list;
  }

  int _compare(Comparable c1, Comparable c2, bool ascending) {
    if (ascending)
      return c1.compareTo(c2);
    else
      return c2.compareTo(c1);
  }
}
