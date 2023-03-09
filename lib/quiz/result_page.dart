import 'package:education_quiz_app/quiz/result_widget.dart';
import 'package:flutter/material.dart';

import '../dice/dice_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: width,
          ),
          const Icon(
            Icons.redeem_sharp,
            color: Colors.green,
            size: 120,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "Resultados de Matemática Soma #156",
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: 340,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: const [
                ResultWidget(
                  icon: Icons.money,
                  label: "Pontos Conquistados",
                  result: "200",
                  color: Colors.black,
                ),
                Divider(),
                ResultWidget(
                  icon: Icons.check,
                  label: "Acertos",
                  result: "4",
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DicePage(),
                ),
              );
            },
            child: Text(
              "Confirmar",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color(0xffF4F3F6),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
