import 'package:coronavirus_stats_app/domain/models/lat_long.dart';
import 'package:coronavirus_stats_app/domain/models/stats_model.dart';

class CountryModel {
  final String name;
  final String code;
  final StatsModel stats;
  final LatLong position;
  final String flagUrl;
  final bool isPinned;

  CountryModel({
    this.name,
    this.code,
    this.stats,
    this.position,
    this.flagUrl,
    this.isPinned,
  });
}
