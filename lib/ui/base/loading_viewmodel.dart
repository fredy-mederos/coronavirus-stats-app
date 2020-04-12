import 'package:coronavirus_stats_app/utils/extensions.dart';
import 'package:rxdart/subjects.dart';

class LoadingViewModel {
  BehaviorSubject<bool> _loadingController = BehaviorSubject();

  Stream<bool> get isLoadingStream => _loadingController.stream;

  bool get isLoading => _loadingController.value;

  set isLoading(bool loading) {
    _loadingController.sinkAddSafe(loading);
  }

  void disposeLoadingViewModel() {
    _loadingController.close();
  }
}
