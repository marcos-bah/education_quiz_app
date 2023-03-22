//criar controller para quiz em dart

import 'package:education_quiz_app/quiz/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizController extends ChangeNotifier {
  late QuizModel quiz;

  QuizController() {
    QuestionModel q1 = QuestionModel(
      primaryText: "João",
      scope: {
        "text": "ganhou",
        "value": 4,
      },
      secondaryText: "R\$ 4 reais de seus pais",
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

    //criar questoes com outros valores e adicionar ao quiz
    QuestionModel q2 = QuestionModel(
      primaryText: "João",
      scope: {
        "text": "emprestou",
        "value": -2,
      },
      secondaryText: "R\$ 2 reais para seu amigo Rodrigo",
      isLost: true,
      options: [
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 1 real",
          scopeText: "deve",
          isLost: true,
          isCorrect: false,
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
          secondaryText: "R\$ 2 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: true,
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

    QuestionModel q3 = QuestionModel(
      primaryText: "João",
      scope: {
        "text": "recebeu",
        "value": 3,
      },
      secondaryText: "R\$ 3 reais do seu pai",
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
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 5 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: true,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 8 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: false,
        ),
      ],
    );

    QuestionModel q4 = QuestionModel(
      primaryText: "João",
      scope: {
        "text": "perdeu",
        "value": -5,
      },
      secondaryText: "R\$ 5 reais na rua",
      isLost: true,
      options: [
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 2 reais",
          scopeText: "deve",
          isLost: false,
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 4 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 0 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: true,
        ),
        OptionModel(
          primaryText: "João agora",
          secondaryText: "R\$ 8 reais",
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
      questions: [q1, q2, q3, q4],
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
