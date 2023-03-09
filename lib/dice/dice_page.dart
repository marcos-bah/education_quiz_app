import 'package:education_quiz_app/dice/dice_widget.dart';
import 'package:flutter/material.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
              ),
              child: const Icon(Icons.close, color: Colors.black),
            ),
          )
        ],
      ),
      body: const Center(
        child: DiceWidget(),
      ),
    );
  }
}
