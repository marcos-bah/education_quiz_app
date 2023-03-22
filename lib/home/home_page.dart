import 'package:education_quiz_app/start/rules.dart';
import 'package:flutter/material.dart';

import '../quiz/quiz_page.dart';
import '../start/start_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Modo de Jogo", style: Theme.of(context).textTheme.headline3),
          SizedBox(
            width: width,
            height: 80,
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const StartPage(),
          //       ),
          //     );
          //   },
          //   child: Text(
          //     "Entrar em uma sala",
          //     style: Theme.of(context).textTheme.bodyText2!.copyWith(
          //           color: const Color(0xffF4F3F6),
          //           fontWeight: FontWeight.bold,
          //         ),
          //   ),
          // ),
          // SizedBox(
          //   width: width,
          //   height: 40,
          // ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StartPage(),
                ),
              );
            },
            child: Text(
              "Individual",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color(0xffF4F3F6),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: width,
            height: 80,
          ),
        ],
      ),
    );
  }
}
