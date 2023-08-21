import 'package:flutter/material.dart';
import 'package:adv_basics/text.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer(this.StartQuiz, {super.key});

  final void Function() StartQuiz;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 60, 224, 142),
        Color.fromARGB(255, 22, 230, 230)
      ])),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: Color.fromARGB(209, 255, 255, 255),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Lets Get Started!!!',
            style: TextStyle(fontSize: 27, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: StartQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('START'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      )),
    );
  }
}
