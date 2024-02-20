import 'package:flutter/material.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_card.dart';

class ThirdRound extends StatefulWidget {
  const ThirdRound({Key? key}) : super(key: key);

  @override
  State<ThirdRound> createState() => _ThirdRoundState();
}

class _ThirdRoundState extends State<ThirdRound> {
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
                    'Third Round',
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
                      fourth: false,
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
                    text: 'Round 4',
                    color: kSecondryColor,
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'FourthRound', arguments: playerScores);
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
