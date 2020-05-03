import 'package:coronavirus_stats_app/ui/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobile/gmap_mobile.dart';
import 'package:web/gmap_web.dart';

Widget GmapWidget(Stream<CountryDataList> dataStream) {
  return GMapWeb(
    dataStream: dataStream,
  );
  return GMapMobile();
}
