import 'package:flutter/material.dart';

class DiceWidget extends StatefulWidget {
  const DiceWidget({super.key});

  @override
  State<DiceWidget> createState() => _DiceWidgetState();
}

class _DiceWidgetState extends State<DiceWidget> {
  Map<int, List<Widget>> dices = {
    1: List.generate(
      1,
      (index) => const Icon(
        Icons.circle,
        color: Color(0xff4F4F4F),
        size: 22,
      ),
    ),
    2: List.generate(
      2,
      (index) => const Icon(
        Icons.circle,
        color: Color(0xff4F4F4F),
        size: 22,
      ),
    ),
    3: List.generate(
      3,
      (index) => const Icon(
        Icons.circle,
        color: Color(0xff4F4F4F),
        size: 22,
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    //criar um widget com sombra de um cubo
    return Container(
      width: 157,
      height: 157,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [...dices[0]!.toList()],
          ),
        ),
      ),
    );
  }
}
