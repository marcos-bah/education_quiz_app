import 'package:education_quiz_app/app/user_model.dart';
import 'package:education_quiz_app/quiz/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../quiz/quiz_page.dart';

class StartContextPage extends StatefulWidget {
  const StartContextPage({super.key});

  @override
  State<StartContextPage> createState() => _StartContextPageState();
}

class _StartContextPageState extends State<StartContextPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthReal = width <= 340 ? width * 0.8 : 340;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Contexto", style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 100,
            width: width,
          ),
          Container(
            width: widthReal,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text.rich(
              TextSpan(
                text: "Nesse jogo, você é ",
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: "João",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color(0xff1F8C55),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: width,
          ),
          Container(
            width: widthReal,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text.rich(
              TextSpan(
                text: "Um jovem que está no ensino fundamental. ",
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: "Sem nenhum dinheiro",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: const Color(0xffA40021),
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120,
            width: width,
          ),
          Consumer<QuizController>(builder: (context, quizController, child) {
            return Consumer<UserModel>(builder: (context, user, child) {
              return TextButton(
                onPressed: () {
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
            });
          })
        ],
      ),
    );
  }
}
