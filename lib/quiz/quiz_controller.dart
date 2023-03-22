//criar controller para quiz em dart

import 'package:education_quiz_app/quiz/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizController extends ChangeNotifier {
  late QuizModel quiz;

  QuizController() {
    QuestionModel q1 = QuestionModel(
      primaryText: "João",
      secondaryText: "R\$ 4 reais para seus pais, ele tinha R\$ 5 reais",
      scopeText: "pediu",
      isLost: false,
      options: [
        OptionModel(
          primaryText: "João",
          secondaryText: "R\$ 1 real",
          scopeText: "tem",
          isLost: false,
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João",
          secondaryText: "R\$ 9 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: true,
        ),
        OptionModel(
          primaryText: "João",
          secondaryText: "R\$ 3 reais",
          scopeText: "tem",
          isLost: false,
          isCorrect: false,
        ),
        OptionModel(
          primaryText: "João",
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
    quiz = QuizModel(
      id: 0,
      category: Category.mathSum,
      score: 100,
      questions: List.generate(
        5,
        (index) => QuestionModel(
          primaryText: "Rodrigo",
          secondaryText: "$index ao seu amigo Pedro",
          scopeText: "deu",
          isLost: true,
          options: [
            OptionModel(
                primaryText: "um",
                secondaryText: "bolo",
                scopeText: "de chocolate",
                isLost: true,
                isCorrect: true),
            OptionModel(
                primaryText: "um",
                secondaryText: "bolo",
                scopeText: "de cenoura",
                isLost: true,
                isCorrect: false),
            OptionModel(
                primaryText: "um",
                secondaryText: "bolo",
                scopeText: "de laranja",
                isLost: true,
                isCorrect: false),
            OptionModel(
                primaryText: "um",
                secondaryText: "bolo",
                scopeText: "de limão",
                isLost: true,
                isCorrect: false),
          ],
        ),
      ),
    );
    notifyListeners();
  }
}
