import 'package:education_quiz_app/quiz/quiz_controller.dart';
import 'package:education_quiz_app/start/rules.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../quiz/quiz_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
          Text("Regras", style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 100,
            width: width,
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
                RulesWidget(
                  text: "Cores ",
                  text2: "verdes",
                  color: Color(0xff1F8654),
                  description: "geralmente indicam ganho",
                ),
                Divider(),
                RulesWidget(
                  text: "Cores ",
                  text2: "vermelhas",
                  color: Color(0xffA40021),
                  description: "geralmente indicam perdas",
                ),
                Divider(),
                RulesWidget(
                  text: "Os dados",
                  color: Color(0xffA40021),
                  description:
                      "Possuem a mesma chance sempre, 1 em cada 6 (lados).",
                ),
                Divider(),
                RulesWidget(
                  text: "Respostas",
                  color: Color(0xff191D63),
                  description:
                      "Quanto mais rápido responder, mais pontos ganha.",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            width: width,
          ),
          Consumer<QuizController>(builder: (context, quizController, child) {
            return TextButton(
              onPressed: () {
                if (quizController.quiz.isLastQuestion) {
                  quizController.reset();
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(),
                  ),
                );
              },
              child: Text(
                !quizController.quiz.isLastQuestion ? "Continuar" : "Começar",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color(0xffF4F3F6),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            );
          })
        ],
      ),
    );
  }
}
