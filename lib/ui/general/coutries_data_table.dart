import 'package:coronavirus_stats_app/domain/models/country_model.dart';
import 'package:coronavirus_stats_app/ui/common/badge.dart';
import 'package:coronavirus_stats_app/ui/common/network_image.dart';
import 'package:coronavirus_stats_app/utils/extensions.dart';
import 'package:flutter/material.dart';

class CountriesDataTable extends StatelessWidget {
  final List<CountryModel> countries;

  const CountriesDataTable({Key key, @required this.countries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 8,
        sortColumnIndex: 1,
        sortAscending: true,
        horizontalMargin: 16,
        columns: [
          DataColumn(label: Text("Country")),
          DataColumn(label: Text("Total\nCases"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("New\nCases"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("Total\nDeaths"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("New\nDeaths"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("Total\nRecovered"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("New\nRecovered"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("Active\nCases"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("Critical"), numeric: true, onSort: (_, a) {}),
          DataColumn(label: Text("Country"), numeric: true),
        ],
        rows: countries
            .map((country) => DataRow(
                  cells: [
                    DataCell(
                      Row(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            child: CustomNetworkImage(
                              url: country.flagUrl,
                              width: 25,
                            ),
                          ),
                          Container(width: 10),
                          Text(
                            country.name,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Container(width: 10),
                        ],
                      ),
                    ),
                    DataCell(Text(country.stats.cases.toString())),
                    //DataCell(Text(country.stats.todayCases.toStringWithSign())),
                    DataCell(
                      (country.stats.todayCases == 0)
                          ? Container()
                          : Badge(
                              child: Text(
                                country.stats.todayCases.toStringWithSign(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.yellow.shade900,
                            ),
                    ),
                    DataCell(Text(country.stats.deaths.toString())),
                    //DataCell(Text(country.stats.todayDeaths.toStringWithSign())),
                    DataCell(
                      (country.stats.todayDeaths == 0)
                          ? Container()
                          : Badge(
                              child: Text(
                                country.stats.todayDeaths.toStringWithSign(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                    ),
                    DataCell(Text(country.stats.recovered.toString())),
                    // DataCell(Text(country.stats.todayRecovered.toStringWithSign())),
                    DataCell(
                      (country.stats.todayRecovered == 0)
                          ? Container()
                          : Badge(
                              child: Text(
                                country.stats.todayRecovered.toStringWithSign(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                    ),
                    DataCell(Text(country.stats.active.toString())),
                    DataCell(Text(country.stats.critical.toString())),
                    DataCell(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: 10),
                          Text(
                            country.name,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Container(width: 10),
                          Container(
                            width: 25,
                            child: CustomNetworkImage(
                              url: country.flagUrl,
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
