import 'package:education_quiz_app/app/user_model.dart';
import 'package:education_quiz_app/quiz/quiz_controller.dart';
import 'package:education_quiz_app/quiz/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionWidget extends StatefulWidget {
  final List<OptionModel> options;
  const OptionWidget({super.key, required this.options});

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  late List<Color> _colors;

  @override
  void initState() {
    _colors = List.generate(
      widget.options.length,
      (index) => Colors.white,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizController>(builder: (context, quizController, child) {
      if (!quizController.quiz.question.isClicked) {
        _colors = List.generate(
          widget.options.length,
          (index) => Colors.white,
        );
      }
      return SizedBox(
        width: 330,
        child: Column(
          children: [
            ...List.generate(
              widget.options.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Consumer<UserModel>(builder: (context, user, child) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _colors[index],
                    ),
                    onPressed: () {
                      setState(() {
                        if (!quizController.quiz.question.isClicked) {
                          quizController.click();
                          user.setMoney(quizController
                              .quiz.question.scope["value"]
                              ?.toDouble());
                          if (widget.options[index].isCorrect) {
                            _colors[index] = Colors.green;
                            user.setPointsGlobal(quizController.quiz.points());
                            user.setPointsLocal(quizController.quiz.points());
                            quizController.quiz.hit();
                          } else {
                            _colors[index] = Colors.red;
                            for (int i = 0; i < widget.options.length; i++) {
                              if (widget.options[i].isCorrect) {
                                _colors[i] = Colors.green;
                              }
                            }
                          }
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: const Color(0xffEDE8E3),
                          child: Text(
                            widget.options[index].getLetter(index),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        SizedBox(
                          width: 260,
                          child: Text.rich(
                            TextSpan(
                              text: widget.options[index].primaryText,
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                const TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: widget.options[index].scopeText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: widget.options[index].color,
                                      ),
                                ),
                                const TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: widget.options[index].secondaryText,
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      );
    });
  }
}
