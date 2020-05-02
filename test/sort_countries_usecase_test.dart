import 'package:coronavirus_stats_app/domain/models/country_model.dart';
import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/domain/usecases/sort_countries_usecase.dart';
import 'package:coronavirus_stats_app/impl/sort_countries_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('sort countries usecase test', () async {
    final usecase = SortCountriesUseCaseImpl();
    final items = <CountryModel>[
      CountryModel(stats: StatsModel(cases: 3, todayCases: 7)),
      CountryModel(stats: StatsModel(cases: 2, todayCases: 8)),
      CountryModel(stats: StatsModel(cases: 1, todayCases: 10)),
      CountryModel(stats: StatsModel(cases: 10, todayCases: 0)),
    ];

    var sortedItems = usecase.sortCountries(items, SortColumn.TOTAL_CASES, true);
    expect(sortedItems[0].stats.cases, 1);
    expect(sortedItems[1].stats.cases, 2);
    expect(sortedItems[2].stats.cases, 3);
    expect(sortedItems[3].stats.cases, 10);

    sortedItems = usecase.sortCountries(items, SortColumn.TOTAL_CASES, false);
    expect(sortedItems[0].stats.cases, 10);
    expect(sortedItems[1].stats.cases, 3);
    expect(sortedItems[2].stats.cases, 2);
    expect(sortedItems[3].stats.cases, 1);

    sortedItems = usecase.sortCountries(items, SortColumn.NEW_CASES, true);
    expect(sortedItems[0].stats.todayCases, 0);
    expect(sortedItems[1].stats.todayCases, 7);
    expect(sortedItems[2].stats.todayCases, 8);
    expect(sortedItems[3].stats.todayCases, 10);

    sortedItems = usecase.sortCountries(items, SortColumn.NEW_CASES, false);
    expect(sortedItems[0].stats.todayCases, 10);
    expect(sortedItems[1].stats.todayCases, 8);
    expect(sortedItems[2].stats.todayCases, 7);
    expect(sortedItems[3].stats.todayCases, 0);
  });
}
