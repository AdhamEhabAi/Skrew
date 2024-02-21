import 'package:flutter/material.dart';

class AddPlayerWidget extends StatelessWidget {
  const AddPlayerWidget({
    required this.text,
    required this.onPressedRemove,
    super.key});

  final String text;
  final VoidCallback onPressedRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Center(
          child: ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/image_1.jpg'),
            ),
            title: Text(text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              color: Colors.white,
              iconSize: 35,
              onPressed: onPressedRemove,
            ),
          ),
        ),
      ),
    );
  }
}
