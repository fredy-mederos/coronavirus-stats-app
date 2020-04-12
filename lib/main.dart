import 'package:coronavirus_stats_app/app.dart';
import 'package:coronavirus_stats_app/di/main_component.dart';
import 'package:flutter/material.dart';

const String _API_BASE_URL = "https://corona.lmao.ninja";

void main() {
  MainComponent.init(mode: Mode.PROD, apiUrl: _API_BASE_URL);
  runApp(CoronavirusStatsApp());
}
