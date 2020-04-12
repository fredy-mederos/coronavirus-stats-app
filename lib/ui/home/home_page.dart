import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/res/R.dart';
import 'package:coronavirus_stats_app/ui/general/general_page.dart';
import 'package:coronavirus_stats_app/ui/general_charts/general_charts_page.dart';
import 'package:coronavirus_stats_app/ui/home/home_viewmodel.dart';
import 'package:coronavirus_stats_app/ui/settings/settings_page.dart';
import 'package:coronavirus_stats_app/viewmodel/state_with_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateWithViewModel<HomePage, HomeViewModel> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        leading: Icon(R.icons.coronavirus),
        title: getTitle(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: onPageSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.viewList),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.chartLine),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.cogOutline),
            title: Container(),
          )
        ],
      ),
      body: getBody(),
    );
  }

  Widget getTitle() => StreamBuilder<StatsModel>(
        stream: viewModel.globalStatsStream,
        builder: (_, snapshot) {
          final data = snapshot.data;
          final title = Text(R.string.appName);
          return data == null
              ? title
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    Text(
                      R.string.updated_x_min_ago(data.updatedTime),
                      style: Theme.of(context).primaryTextTheme.subtitle,
                    ),
                  ],
                );
        },
      );

  Widget getBody() {
    switch (currentPage) {
      case 0:
        return GeneralPage();
      case 1:
        return GeneralChartsPage();
      case 2:
        return SettingsPage();
    }
    return Container();
  }

  void onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
