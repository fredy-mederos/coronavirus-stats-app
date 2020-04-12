import 'package:coronavirus_stats_app/domain/models/historical_model.dart';

class StatsModel {
  final DateTime updatedTime;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int todayActive;
  final int critical;
  final int todayCritical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final double testsPerOneMillion;
  final int affectedCountries;
  final List<HistoricalModel> historicalCases;
  final List<HistoricalModel> historicalDeaths;
  final List<HistoricalModel> historicalRecovered;

  StatsModel({
    this.cases = 0,
    this.todayCases = 0,
    this.deaths = 0,
    this.todayDeaths = 0,
    this.recovered = 0,
    this.todayRecovered,
    this.active = 0,
    this.todayActive = 0,
    this.critical = 0,
    this.todayCritical = 0,
    this.casesPerOneMillion = 0,
    this.deathsPerOneMillion = 0,
    this.tests = 0,
    this.testsPerOneMillion = 0,
    this.affectedCountries = 0,
    this.updatedTime,
    this.historicalCases = const <HistoricalModel>[],
    this.historicalDeaths = const <HistoricalModel>[],
    this.historicalRecovered = const <HistoricalModel>[],
  });
}
