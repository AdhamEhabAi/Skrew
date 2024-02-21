import 'package:flutter/material.dart';


class PlayerResult extends StatelessWidget {
  final String playerName;
  final int playerScore;
  final bool isLowestScore;

  const PlayerResult({
    Key? key,
    required this.playerName,
    required this.playerScore,
    required this.isLowestScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: isLowestScore ? Colors.green : Colors.purple, // Change the color condition
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

