import 'package:education_quiz_app/app/user_model.dart';
import 'package:education_quiz_app/quiz/option_widget.dart';
import 'package:education_quiz_app/quiz/quiz_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../result/result_page.dart';
import '../start/start_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double widthReal = width <= 340 ? width * 0.8 : 340;
    return Consumer<QuizController>(builder: (context, quizController, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            quizController.quiz.categoryNameID,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
          leadingWidth: 100,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                fixedSize: const Size(60, 20),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.money,
                    color: Colors.black,
                  ),
                  Consumer<UserModel>(builder: (context, user, child) {
                    return Text(
                      user.getPointsGlobal.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 14),
                    );
                  }),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StartPage(),
                    ),
                  );
                },
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
              width: width,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: widthReal - 40,
                  height: 12,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: LinearProgressIndicator(
                      value: quizController.quiz.percentage,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation(
                        Color(0xff31CD63),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  quizController.quiz.step,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w300,
                    color: Color(0xff757575),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: widthReal,
              child: Text.rich(
                TextSpan(
                  text: quizController.quiz.question.primaryText,
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    const TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: quizController.quiz.question.scope["text"],
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: quizController.quiz.question.color,
                          ),
                    ),
                    const TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: quizController.quiz.question.secondaryText,
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<UserModel>(builder: (context, user, child) {
              return SizedBox(
                width: widthReal,
                child: Text.rich(
                  TextSpan(
                    text: "Seu dinheiro: ",
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: "${user.getMoney} reais.",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: user.getIsLoss
                                  ? Colors.red
                                  : const Color(0xff1F8C55),
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            OptionWidget(options: quizController.quiz.question.options),
            const Spacer(),
            TextButton(
              onPressed: () {
                if (quizController.quiz.isLastQuestion) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ResultPage(),
                    ),
                  );
                } else {
                  if (quizController.quiz.question.isClicked) {
                    quizController.nextQuestion();
                  }
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: quizController.quiz.question.isClicked
                    ? const Color(0xff31CD63)
                    : const Color(0xff757575),
              ),
              child: Text(
                quizController.quiz.isLastQuestion
                    ? "Ver resultado"
                    : "CONTINUE",
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
