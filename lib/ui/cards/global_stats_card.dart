import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/res/R.dart';
import 'package:coronavirus_stats_app/ui/common/badge.dart';
import 'package:coronavirus_stats_app/utils/extensions.dart';
import 'package:flutter/material.dart';

class GlobalStatsCard extends StatelessWidget {
  final StatsModel statsModel;

  const GlobalStatsCard({Key key, @required this.statsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final confirmedCard = StatCard(
      title: R.string.confirmed,
      subtitle: statsModel.cases.toString(),
      trailingTitle: statsModel.todayCases.toStringWithSign(),
      subtitleColor: Colors.yellow.shade900,
    );

    final activeCard = StatCard(
      title: R.string.active,
      subtitle: statsModel.active.toString(),
      trailingTitle: statsModel.todayActive.toStringWithSign(),
      subtitleColor: Colors.blue,
    );

    final recoveredCard = StatCard(
      title: R.string.recovered,
      subtitle: statsModel.recovered.toString(),
      trailingTitle: statsModel.todayRecovered.toStringWithSign(),
      subtitleColor: Colors.green,
    );

    final critical = StatCard(
      title: R.string.critical,
      subtitle: statsModel.critical.toString(),
      trailingTitle: statsModel.todayCritical.toStringWithSign(),
      subtitleColor: Colors.deepPurple,
    );

    final deathCard = StatCard(
      title: R.string.deceased,
      subtitle: statsModel.deaths.toString(),
      trailingTitle: statsModel.todayDeaths.toStringWithSign(),
      subtitleColor: Colors.red,
    );

    final widthSize = MediaQuery.of(context).size.width;
    List<TableRow> children;
    if (widthSize <= 600) {
      children = [
        TableRow(
          children: [confirmedCard, deathCard],
        ),
        TableRow(
          children: [recoveredCard, activeCard],
        ),
        TableRow(
          children: [critical, Container()],
        )
      ];
    } else if (widthSize <= 900) {
      children = [
        TableRow(
          children: [confirmedCard, deathCard, recoveredCard],
        ),
        TableRow(
          children: [activeCard, critical, Container()],
        )
      ];
    } else {
      children = [
        TableRow(
          children: [confirmedCard, deathCard, recoveredCard, activeCard, critical],
        ),
      ];
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Table(
        children: children,
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color subtitleColor;
  final String trailingTitle;

  const StatCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.trailingTitle,
    @required this.subtitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 14)),
            Text(trailingTitle, style: TextStyle(fontSize: 12)),
          ],
        ),
        subtitle: Text(subtitle,
            style: TextStyle(
              fontSize: 30,
              color: subtitleColor,
            )),
      ),
    );
  }
}
