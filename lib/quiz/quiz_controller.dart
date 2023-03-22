//criar controller para quiz em dart

import 'package:education_quiz_app/quiz/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizController extends ChangeNotifier {
  late QuizModel quiz;

  QuizController() {
    QuestionModel q1 = QuestionModel(
      primaryText: "João",
      scope: {
        "text": "pediu",
        "value": 4,
      },
      secondaryText: "R\$ 4 reais para seus pais",
      isLost: false,
      options: [
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 1 real",
          scopeText: "tem",
          isLost: false,
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 4 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: true,
        ),
        OptionModel(
          primaryText: "João está",
          secondaryText: "R\$ 3 reais",
          scopeText: "devendo",
          isLost: true,
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 5 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: false,
        ),
      ],
    );
    quiz = QuizModel(
      id: 0,
      category: Category.mathSum,
      score: 100,
      questions: [q1, q1, q1, q1],
    );
  }

  void nextQuestion() {
    quiz.nextQuestion();
    notifyListeners();
  }

  void click() {
    quiz.question.click();
    notifyListeners();
  }

  void reset() {
    for (var element in quiz.questions) {
      element.click(action: false);
    }
    quiz.setPos(0);
    notifyListeners();
  }
}
