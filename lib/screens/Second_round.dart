import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
import 'package:screw/screens/thirdRound.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_card.dart';

class SecondRound extends StatefulWidget {
  final Map<String,int> totalResult;
  const SecondRound({Key? key, required this.totalResult}) : super(key: key);

  @override
  State<SecondRound> createState() => _SecondRoundState();
}

class _SecondRoundState extends State<SecondRound> {
  Map<String, int> playerScores = {};
  late Map<String, int> totalResult;

  @override
  void initState() {
    totalResult = widget.totalResult; // Initialize totalResult in initState
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
                          'Silent Round',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/images/silent.png'),
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
                      text: 'Round 3',
                      color: kSecondryColor,
                      onTap: () {
                        addScoreToResult(playerScores, totalResult);
                        for (var value in playerScores.keys) {
                          playerScores[value] = 0;
                        }
                        Get.offAll(() => ThirdRound(totalResult: totalResult,), arguments: playerScores,transition: Transition.rightToLeft);

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

