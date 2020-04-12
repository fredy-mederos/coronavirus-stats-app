import 'package:coronavirus_stats_app/app.dart';
import 'package:coronavirus_stats_app/di/main_component.dart';
import 'package:flutter/material.dart';

void main() {
  MainComponent.init(mode: Mode.STUB, apiUrl: "");
  runApp(CoronavirusStatsApp());
}
