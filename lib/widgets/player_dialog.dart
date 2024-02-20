import 'package:flutter/material.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/widgets/custom_button.dart';
import 'package:screw/widgets/custom_textField.dart';

class PlayerDialog extends StatefulWidget {
  final void Function(String) onPlayerAdded;

  const PlayerDialog({Key? key, required this.onPlayerAdded}) : super(key: key);

  @override
  State<PlayerDialog> createState() => _PlayerDialogState();
}

class _PlayerDialogState extends State<PlayerDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late String playerName = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 290,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(40)),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const Text(
                        'Add Your Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        validator: (value){
                          if (value!.isEmpty) {
                            return 'Write a Name';
                          } else {

                          }
                        },
                        hintText: 'Player Name',
                        onChanged: (value) {
                          playerName = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Add Player',
                        color: kSecondryColor,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            widget.onPlayerAdded(playerName);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}