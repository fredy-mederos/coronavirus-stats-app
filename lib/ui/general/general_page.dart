import 'package:coronavirus_stats_app/domain/models/country_model.dart';
import 'package:coronavirus_stats_app/domain/models/stats_model.dart';
import 'package:coronavirus_stats_app/ui/cards/global_stats_card.dart';
import 'package:coronavirus_stats_app/ui/general/coutries_data_table.dart';
import 'package:coronavirus_stats_app/ui/home/home_viewmodel.dart';
import 'package:coronavirus_stats_app/viewmodel/viewmodel_provider.dart';
import 'package:flutter/material.dart';

class GeneralPage extends StatefulWidget {
  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ViewModelProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() => Stack(
        children: [
          loadingIndicator(),
          SingleChildScrollView(
            child: Column(
              children: [
                globalStatsCard(),
                getCountriesList(),
              ],
            ),
          ),
        ],
      );

  Widget loadingIndicator() => StreamBuilder<bool>(
        stream: viewModel.isLoadingStream,
        initialData: false,
        builder: (_, snapshot) {
          final isLoading = snapshot.data ?? false;
          return isLoading ? Center(child: CircularProgressIndicator()) : Container();
        },
      );

  Widget globalStatsCard() => StreamBuilder<StatsModel>(
        stream: viewModel.globalStatsStream,
        builder: (_, snapshot) {
          final data = snapshot.data;
          return (data != null) ? GlobalStatsCard(statsModel: data) : Container();
        },
      );

  Widget getCountriesList() => StreamBuilder<List<CountryModel>>(
        stream: viewModel.countriesStatsStream,
        initialData: <CountryModel>[],
        builder: (_, snapshot) {
          final data = snapshot.data;
          if (data.isEmpty) return Container();
          return CountriesDataTable(countries: data);
        },
      );
}
