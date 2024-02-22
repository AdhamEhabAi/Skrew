import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:screw/screens/First_Round.dart';
import 'package:screw/screens/Second_round.dart';
import 'package:screw/screens/config_page.dart';
import 'package:screw/screens/explain_page.dart';
import 'package:screw/screens/fourth_round.dart';
import 'package:screw/screens/result_screen.dart';
import 'package:screw/screens/splash_screen.dart';
import 'package:screw/screens/thirdRound.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      initialRoute: 'SplashScreen',
      debugShowCheckedModeBanner: false,
      routes: {
        'SplashScreen' :(context) => const SplashScreen(),
        'ConfigPage' : (context) => const ConfigPage(oldPlayers: {},),
        'ExplainPage' : (context) => const ExplainPage(),
        'FirstRound' : (context) => const FirstRound(),
        'SecondRound' : (context) => const SecondRound(totalResult: {},),
        'ThirdRound' : (context) => const ThirdRound(totalResult: {},),
        'FourthRound' : (context) => const FourthRound(totalResult: {},),
        'ResultScreen' : (context) => const ResultScreen(),
      },
    );
  }
}

