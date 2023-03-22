import 'package:education_quiz_app/app/user_model.dart';
import 'package:education_quiz_app/quiz/quiz_controller.dart';
import 'package:education_quiz_app/quiz/result_widget.dart';
import 'package:education_quiz_app/start/start_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Consumer<UserModel>(builder: (context, user, child) {
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
            Consumer<QuizController>(builder: (context, quizController, child) {
              return Text(
                quizController.quiz.categoryNameID,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
              );
            }),
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
                children: [
                  ResultWidget(
                    icon: Icons.money,
                    label: "Pontos Conquistados",
                    result: user.getPointsLocal.toString(),
                    color: Colors.black,
                  ),
                  const Divider(),
                  Consumer<QuizController>(
                      builder: (context, quizController, child) {
                    return ResultWidget(
                      icon: Icons.check,
                      label: "Acertos",
                      result: quizController.quiz.hits.toString(),
                      color: Colors.black,
                    );
                  }),
                ],
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StartPage(),
                  ),
                );
              },
              child: Text(
                "Voltar ao início",
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
    });
  }
}
