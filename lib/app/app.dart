import 'package:education_quiz_app/app/theme.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Educação',
      theme: ThemaApp.global,
      home: const HomePage(),
    );
  }
}
