import 'package:flutter/material.dart';

class PlayerResult extends StatelessWidget {
  final String playerName;
  final int playerScore;
  final bool isLowestScore;
  final bool isHighestScore;

  const PlayerResult({
    Key? key,
    required this.playerName,
    required this.playerScore,
    required this.isLowestScore,
    required this.isHighestScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (isHighestScore) {
      backgroundColor = Colors.red; // Red for highest score
    } else if (isLowestScore) {
      backgroundColor = Colors.green; // Green for lowest score
    } else {
      backgroundColor = Colors.purple; // Default color
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/image_1.jpg'),
            ),
            title: Text(
              playerName,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            trailing: Text(
              '$playerScore',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
