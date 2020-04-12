import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_global_stats_usecase.dart';

class GetGlobalStatsUseCaseStubImpl implements GetGlobalStatsUseCase {
  @override
  Future<StatsModel> getGlobalStats({bool allowCachedData = true}) {
    return Future.delayed(Duration(seconds: 2), () {
      return StatsModel(
        updatedTime: DateTime.now().subtract(Duration(minutes: 30)),
        cases: 3000,
        todayCases: 1000,
        active: 2000,
        todayActive: 40,
        deaths: 500,
        todayDeaths: 51,
        recovered: 300,
        todayRecovered: 200,
        critical: 20,
        todayCritical: -2
      );
    });
  }
}
