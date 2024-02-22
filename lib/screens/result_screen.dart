import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/screens/config_page.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/player_result.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Map<String, int> playerScores;
  late List<String> playersWithLowestScore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    playerScores = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    playersWithLowestScore = _findPlayersWithLowestScore(playerScores);
  }

  List<String> _findPlayersWithLowestScore(Map<String, int> scores) {
    // Find the lowest score
    int lowestScore = scores.values.reduce((value, element) => value < element ? value : element);

    // Find players with the lowest score
    return scores.entries.where((entry) => entry.value == lowestScore).map((entry) => entry.key).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                    itemBuilder: (context, index) {
                      String playerName = playerScores.keys.elementAt(index);
                      int playerScore = playerScores.values.elementAt(index);
                      bool isLowestScore = playersWithLowestScore.contains(playerName);
                      return PlayerResult(
                        playerName: playerName,
                        playerScore: playerScore,
                        isLowestScore: isLowestScore,
                      );
                    },
                  ),
                  CustomButton(
                    text: 'New Game',
                    color: kSecondryColor,
                    onTap: () {
                      Get.offAll(() => ConfigPage(oldPlayers: playerScores,),transition: Transition.zoom);
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
