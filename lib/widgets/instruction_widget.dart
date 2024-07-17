import 'package:flutter/material.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({super.key, required this.img, required this.head, required this.text});
  final String img;
  final String head;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        ImageIcon(
          AssetImage(img),
          color: Colors.grey,
          size: 40,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                head,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
