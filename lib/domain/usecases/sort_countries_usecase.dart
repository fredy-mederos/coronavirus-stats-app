import 'package:coronavirus_stats_app/domain/models/country_model.dart';

abstract class SortCountriesUseCase {
  List<CountryModel> sortCountries(List<CountryModel> countries, SortColumn sortColumn, bool ascending);
}

enum SortColumn {
  TOTAL_CASES,
  NEW_CASES,
  TOTAL_DEATHS,
  NEW_DEATHS,
  TOTAL_RECOVERED,
  NEW_RECOVERED,
  TOTAL_ACTIVE,
  TODAY_ACTIVE,
  TOTAL_CRITICAL,
  TODAY_CRITICAL,
  TOTAL_TESTS,
}
