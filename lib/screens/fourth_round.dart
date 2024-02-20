import 'package:flutter/material.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_card.dart';

class FourthRound extends StatefulWidget {
  const FourthRound({Key? key}) : super(key: key);

  @override
  State<FourthRound> createState() => _FourthRoundState();
}

class _FourthRoundState extends State<FourthRound> {
  Map<String, int> playerScores = {};

  @override
  Widget build(BuildContext context) {
    playerScores = ModalRoute.of(context)!.settings.arguments as Map<String, int>;

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
                    'Final Round',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: playerScores.length,
                    itemBuilder: (context, index) => PlayerCard(
                      fourth: true,
                      playerName: playerScores.keys.elementAt(index),
                      playerScore: playerScores.values.elementAt(index),
                      onScoreChanged: (int score) {
                        setState(() {
                          playerScores[playerScores.keys.elementAt(index)] = score;
                        });
                      },
                    ),
                  ),
                  CustomButton(
                    text: 'Finish',
                    color: kSecondryColor,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'ResultScreen', arguments: playerScores);
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
