import 'package:coronavirus_stats_app/domain/models/historical_model.dart';

class StatsModel {
  final DateTime updatedTime;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final double testsPerOneMillion;
  final int affectedCountries;
  final List<HistoricalModel> historicalCases;
  final List<HistoricalModel> historicalDeaths;
  final List<HistoricalModel> historicalRecovered;

  StatsModel({
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.affectedCountries,
    this.updatedTime,
    this.historicalCases,
    this.historicalDeaths,
    this.historicalRecovered,
  });
}
