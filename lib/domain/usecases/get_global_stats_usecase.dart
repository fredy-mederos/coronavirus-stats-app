import 'package:coronavirus_stats_app/domain/models/stats_model.dart';

abstract class GetGlobalStatsUseCase {
  ///Returns the global stats. Use [allowCachedData] to force load the latest information from the external API.
  Future<StatsModel> getGlobalStats({bool allowCachedData = true});
}
