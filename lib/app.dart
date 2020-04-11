import 'package:coronavirus_stats_app/di/main_component.dart';
import 'package:coronavirus_stats_app/res/R.dart';
import 'package:coronavirus_stats_app/res/text/custom_localizations_delegate.dart';
import 'package:coronavirus_stats_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final localizationDelegate = CustomLocalizationsDelegate();
    return MaterialApp(
      title: R.string.appName,
      debugShowCheckedModeBanner: MainComponent.instance.isInDebugMode(),
      theme: _lightTheme,
      //darkTheme: _darkTheme,
      localizationsDelegates: [
        localizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      localeResolutionCallback: localizationDelegate.resolution(
        fallback: Locale("en"),
      ),
      home: HomePage(),
    );
  }
}

ThemeData get _lightTheme => ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      primarySwatch: Colors.pink,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );

ThemeData get _darkTheme => ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
      primarySwatch: Colors.pink,
      accentColor: Colors.pink,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
