import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
import 'package:screw/screens/fourth_round.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_card.dart';

class ThirdRound extends StatefulWidget {
  final Map<String,int> totalResult;

  const ThirdRound({Key? key, required this.totalResult}) : super(key: key);

  @override
  State<ThirdRound> createState() => _ThirdRoundState();
}

class _ThirdRoundState extends State<ThirdRound> {
  Map<String, int> playerScores = {};
  late Map<String, int> totalResult;
  @override
  void initState() {
    totalResult = widget.totalResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    playerScores = ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    return WillPopScope(
      onWillPop:() => onBackButtonPressed(context),
      child: Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Blind Round',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/blind.png'),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: playerScores.length,
                      itemBuilder: (context, index) => PlayerCard(
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
                        addScoreToResult(playerScores, totalResult);
                        for (var value in playerScores.keys) {
                          playerScores[value] = 0;
                        }
                        Get.offAll(() => FourthRound(totalResult: totalResult,), arguments: playerScores,transition: Transition.rightToLeft);
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
