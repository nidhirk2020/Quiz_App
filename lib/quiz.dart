import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:adv_basics/gradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/text.dart';
import 'package:adv_basics/result_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAns = [];
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAns(String answer) {
    selectedAns.add(answer);
    if (selectedAns.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = GradientContainer(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAns);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAns: selectedAns,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 60, 224, 142),
                Color.fromARGB(255, 22, 230, 230)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
