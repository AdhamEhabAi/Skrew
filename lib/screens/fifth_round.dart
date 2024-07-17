import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
import 'package:screw/screens/result_screen.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_card.dart';

class FifthRound extends StatefulWidget {
  final Map<String, int> totalResult;
  const FifthRound({Key? key, required this.totalResult}) : super(key: key);

  @override
  State<FifthRound> createState() => _FifthRoundState();
}

class _FifthRoundState extends State<FifthRound> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Final Doubled Round',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/images/finish.png'),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                    CustomButton(
                      text: 'Finish',
                      color: kSecondryColor,
                      onTap: () {
                        for (var key in playerScores.keys) {
                          if (playerScores.containsKey(key)) {
                            playerScores[key] = (playerScores[key]!) * 2;
                          }
                        }
                        addScoreToResult(playerScores, totalResult);

                        Get.offAll(() => const ResultScreen(),
                            arguments: totalResult,
                            transition: Transition.fadeIn);
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