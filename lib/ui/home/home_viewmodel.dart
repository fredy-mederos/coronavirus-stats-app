import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/domain/usecases/get_global_stats_usecase.dart';
import 'package:coronavirus_stats_app/ui/base/loading_viewmodel.dart';
import 'package:coronavirus_stats_app/viewmodel/base_viewmodel.dart';
import 'package:rxdart/subjects.dart';

class HomeViewModel with LoadingViewModel implements BaseViewModel {
  final GetGlobalStatsUseCase _getGlobalStatsUseCase;

  HomeViewModel(this._getGlobalStatsUseCase);

  BehaviorSubject<StatsModel> _globalStatsSubject = BehaviorSubject();

  Stream<StatsModel> get globalStatsStream => _globalStatsSubject.stream;

  void loadData({bool allowCachedData = true}) async {
    isLoading = true;
    try {
      final stats = await _getGlobalStatsUseCase.getGlobalStats(allowCachedData: allowCachedData);
      _globalStatsSubject.sinkAddSafe(stats);
    } catch (ex) {}
    isLoading = false;
  }

  @override
  void dispose() {
    disposeLoadingViewModel();
    _globalStatsSubject.close();
  }
}
