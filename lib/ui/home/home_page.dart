import 'package:coronavirus_stats_app/res/R.dart';
import 'package:coronavirus_stats_app/ui/home/home_viewmodel.dart';
import 'package:coronavirus_stats_app/viewmodel/state_with_viewmodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateWithViewModel<HomePage, HomeViewModel> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(R.string.appName),
      ),
    );
  }
}
