import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
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
  late int highestScore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    playerScores = ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    playersWithLowestScore = _findPlayersWithLowestScore(playerScores);
    highestScore = _findHighestScore(playerScores);
  }

  List<String> _findPlayersWithLowestScore(Map<String, int> scores) {
    // Find the lowest score
    int lowestScore = scores.values.reduce((value, element) => value < element ? value : element);

    // Find players with the lowest score
    return scores.entries.where((entry) => entry.value == lowestScore).map((entry) => entry.key).toList();
  }

  int _findHighestScore(Map<String, int> scores) {
    // Find the highest score
    return scores.values.reduce((value, element) => value > element ? value : element);
  }

  @override
  Widget build(BuildContext context) {
    // Convert the map to a list of entries and sort it based on the scores in ascending order
    List<MapEntry<String, int>> sortedEntries = playerScores.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

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
                      itemCount: sortedEntries.length,
                      itemBuilder: (context, index) {
                        String playerName = sortedEntries[index].key;
                        int playerScore = sortedEntries[index].value;
                        bool isLowestScore = playersWithLowestScore.contains(playerName);
                        bool isHighestScore = playerScore == highestScore;
                        return PlayerResult(
                          playerName: playerName,
                          playerScore: playerScore,
                          isLowestScore: isLowestScore,
                          isHighestScore: isHighestScore,
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
      ),
    );
  }
}
