import 'dart:ui';

enum Category {
  mathSum,
  mathSub,
}

extension CategoryExtension on Category {
  String get name {
    switch (this) {
      case Category.mathSum:
        return 'Matemática Soma';
      case Category.mathSub:
        return 'Matemática Subtração';
    }
  }

  String get image {
    switch (this) {
      case Category.mathSum:
        return 'assets/images/math_sum.png';
      case Category.mathSub:
        return 'assets/images/math_sub.png';
    }
  }
}

class OptionModel {
  String primaryText;
  String secondaryText;
  String scopeText;
  bool isLost;
  final bool isCorrect;

  OptionModel(
      {required this.primaryText,
      required this.secondaryText,
      required this.scopeText,
      required this.isLost,
      required this.isCorrect});

  Color get color => isLost ? const Color(0xffA40021) : const Color(0xff1F8654);

  static const List<String> letter = [
    'A',
    'B',
    'C',
    'D',
  ];

  String getLetter(int index) => letter[index];
}

class QuestionModel {
  String primaryText;
  Map<String, dynamic> scope;
  String secondaryText;
  bool isLost;
  List<OptionModel> options;
  bool clicked = false;

  QuestionModel({
    required this.primaryText,
    required this.scope,
    required this.secondaryText,
    required this.isLost,
    required this.options,
  });

  Color get color => isLost ? const Color(0xffA40021) : const Color(0xff1F8654);
  bool get isClicked => clicked;

  void click({action = true}) {
    clicked = action;
  }
}

class QuizModel {
  final int id;
  final Category category;
  final List<QuestionModel> questions;
  final int score;
  int position = 0;
  int hits = 0;

  QuizModel({
    required this.id,
    required this.category,
    required this.questions,
    required this.score,
  });

  String get categoryNameID => '${category.name} - #$id';
  String get step => '$position de ${questions.length}';
  QuestionModel get question => questions[position];
  bool get isLastQuestion => position == questions.length - 1;
  double get percentage => position / questions.length;

  void nextQuestion() {
    if (position < questions.length) {
      position++;
      question.click(action: false);
    }
  }

  void setPos(int pos) {
    position = pos;
  }

  int points() {
    return score ~/ questions.length;
  }

  void hit() {
    hits++;
  }
}
