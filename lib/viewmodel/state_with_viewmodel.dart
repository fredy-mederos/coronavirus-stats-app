import 'package:coronavirus_stats_app/di/main_component.dart';
import 'package:coronavirus_stats_app/utils/logger.dart';
import 'package:coronavirus_stats_app/viewmodel/base_viewmodel.dart';
import 'package:coronavirus_stats_app/viewmodel/viewmodel_provider.dart';
import 'package:flutter/widgets.dart';

///This state already setups a [ViewModel] as it's main child.
abstract class StateWithViewModel<W extends StatefulWidget, VM extends BaseViewModel> extends State<W> {
  ///Current viewModel instance
  VM viewModel;
  Logger logger;

  @override
  void initState() {
    super.initState();
    logger = MainComponent.instance.getDependency();
    viewModel = MainComponent.instance.getDependency();
    logger.log('$runtimeType initState');
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
    logger.log('$runtimeType dispose');
  }

  @override
  Widget build(BuildContext context) {
    logger.log('$runtimeType build');
    return ViewModelProvider(
      viewModel: viewModel,
      child: buildWidget(context),
    );
  }

  ///Use this one instead of [build]
  Widget buildWidget(BuildContext context);
}
