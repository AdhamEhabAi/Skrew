import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/constants/functions.dart';
import 'package:screw/screens/config_page.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/instruction_widget.dart';

class ExplainPage extends StatelessWidget {
  const ExplainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Game Rounds:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const InstructionWidget(
                      head: "Round 1",
                      img: 'assets/images/number-1.png',
                      text:
                          'Everyone looks at only the first two cards on the right.Warning: If a player tries to swap cards or look at more than two +10.'),
                  const SizedBox(
                    height: 15,
                  ),

                  const InstructionWidget(
                      head: "Round 2",
                      img: 'assets/images/number-2.png',
                      text:
                      'the same as the first round'),
                  const SizedBox(
                    height: 15,
                  ),
                  const InstructionWidget(
                      head: "Round 3",
                      img: 'assets/images/number-3.png',
                      text:
                      'Silent Round.Warning: Speaking during the silent round +10.'),
                  const SizedBox(
                    height: 15,
                  ),
                  const InstructionWidget(
                      head: "Round 4",
                      img: 'assets/images/number-4.png',
                      text:
                      'No player can look at any of their cards.Warning: If a player looks at a card +10.'),

                  const SizedBox(
                    height: 15,
                  ),
                  const InstructionWidget(
                      head: "Round 5",
                      img: 'assets/images/number-5.png',
                      text:
                      'Double Round: Total accumulated points after the end of Round 2.'),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    text: 'Let\'s Start',
                    color: kSecondryColor,
                    width: 200,
                    onTap: () {
                      Get.offAll(() => const ConfigPage(oldPlayers: {}),
                          transition: Transition.fadeIn);
                    },
                  ),
                  const SizedBox(
                    height: 25,
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
