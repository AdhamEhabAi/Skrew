import 'package:flutter/material.dart';
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
    return MaterialApp(
      home: const SplashScreen(),
      initialRoute: 'SplashScreen',
      debugShowCheckedModeBanner: false,
      routes: {
        'SplashScreen' :(context) => const SplashScreen(),
        'ConfigPage' : (context) => const ConfigPage(),
        'ExplainPage' : (context) => const ExplainPage(),
        'FirstRound' : (context) => const FirstRound(),
        'SecondRound' : (context) => const SecondRound(),
        'ThirdRound' : (context) => const ThirdRound(),
        'FourthRound' : (context) => const FourthRound(),
        'ResultScreen' : (context) => const ResultScreen(),
      },
    );
  }
}

