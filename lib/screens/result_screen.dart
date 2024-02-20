import 'package:flutter/material.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_result.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Map<String, int> playerScores = {};

  @override
  Widget build(BuildContext context) {
    playerScores = ModalRoute.of(context)!.settings.arguments as Map<String, int>;


    // Find the player with the highest score
    int highestScore = playerScores.values.reduce((value, element) => value > element ? value : element);
    String playerWithHighestScore = playerScores.keys.firstWhere((key) => playerScores[key] == highestScore);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [kPrimaryColor, kSecondryColor],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Result\'s',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: playerScores.length,
                    itemBuilder: (context, index) => PlayerResult(
                      playerName: playerScores.keys.elementAt(index),
                      playerScore: playerScores.values.elementAt(index),
                      isHighestScore: playerScores.keys.elementAt(index) == playerWithHighestScore,
                    ),
                  ),

                  CustomButton(
                    text: 'New Game',
                    color: kSecondryColor,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'ConfigPage');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}