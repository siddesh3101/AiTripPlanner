import 'package:coep/pages/button.dart';
import 'package:coep/pages/fake_shut_down.dart';
import 'package:coep/pages/home_page.dart';
import 'package:coep/pages/home_screen.dart';
import 'package:coep/pages/offline_page.dart';
import 'package:coep/pages/select_date.dart';
import 'package:coep/pages/siren.dart';
import 'package:coep/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'geofenching.dart';
import 'maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [
          Locale('en', ''),
          Locale('zh', ''),
          Locale('he', ''),
          Locale('es', ''),
          Locale('ru', ''),
          Locale('ko', ''),
          Locale('hi', ''),
        ],
        home: WelcomePage());
  }
}
