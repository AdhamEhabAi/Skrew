import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
import 'package:screw/screens/third_round.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_card.dart';

class SecondRound extends StatefulWidget {
  final Map<String, int> totalResult;
  const SecondRound({Key? key, required this.totalResult,}) : super(key: key);

  @override
  State<SecondRound> createState() => _SecondRoundState();
}

class _SecondRoundState extends State<SecondRound> {
  Map<String, int> playerScores = {};
  late Map<String, int> totalResult;


  @override
  void initState() {
    totalResult = widget.totalResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    playerScores =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: Scaffold(
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const AlwaysScrollableScrollPhysics(),
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
                      'Second Round',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Add this line
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: playerScores.length,
                      itemBuilder: (context, index) => PlayerCard(
                        playerName: playerScores.keys.elementAt(index),
                        playerScore: playerScores.values.elementAt(index),
                        onScoreChanged: (int score) {
                          setState(() {
                            playerScores[playerScores.keys.elementAt(index)] =
                                score;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Round 2',
                      color: kSecondryColor,
                      onTap: () {
                        addScoreToResult(playerScores, totalResult);
                        for (var value in playerScores.keys) {
                          playerScores[value] = 0;
                        }
                        Get.offAll(
                            () => ThirdRound(
                                  totalResult: totalResult,
                                ),
                            arguments: playerScores,
                            transition: Transition.rightToLeft);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
