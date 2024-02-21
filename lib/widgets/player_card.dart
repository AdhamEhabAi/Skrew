import 'package:flutter/material.dart';
import 'package:screw/constants/colors.dart';
import 'package:screw/widgets/custom_textField.dart';

class PlayerCard extends StatefulWidget {
  const PlayerCard({
    Key? key,
    required this.playerName,
    required this.playerScore,
    required this.onScoreChanged,
  }) : super(key: key);

  final String playerName;
  final int playerScore; // Added playerScore variable
  final ValueChanged<int> onScoreChanged;

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  final TextEditingController _scoreController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _scoreController.text = widget.playerScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    _scoreController.text = widget.playerScore.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/image_1.jpg'),
            ),
            title: Text(
              widget.playerName,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onScoreChanged(widget.playerScore + 10);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kSecondryColor,
                    ),
                    child: const Center(
                      child: Text(
                        '+10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kSecondryColor,
                  ),
                  child: Center(
                    child: CustomTextFormField(
                      controller: _scoreController,
                      hintText: '0',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.onScoreChanged(int.parse(value));

                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
