import 'package:flutter/material.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/widgets/custom_button.dart';

class ExplainPage extends StatelessWidget {
  const ExplainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The Explanation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                'Game Rounds:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                '=> Round 1: Everyone looks at only the first two cards on the right.\nWarning: If a player tries to swap cards or look at more than two +10.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                '=> Round 2: Silent Round.\nWarning: Speaking during the silent round +10.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                '=> Round 3: No player can look at any of their cards.\nWarning: If a player looks at a card +10.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                '=> Round 4: Double Round: Total accumulated points after the end of Round 2.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 25,),
              CustomButton(
                text: 'Let\'s Start',
                color: kSecondryColor,
                width: 200,
                onTap: ()
                {
                  Navigator.pushReplacementNamed(context, 'ConfigPage');
                },
              ),
              const SizedBox(height: 25,),

            ],
          ),
        ),
      ),
    );
  }
}
