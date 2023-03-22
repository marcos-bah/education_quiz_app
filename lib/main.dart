import 'package:education_quiz_app/quiz/quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'app/user_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => QuizController(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserModel(),
      ),
    ],
    child: const App(),
  ));
}
