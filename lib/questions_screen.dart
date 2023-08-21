import 'package:flutter/material.dart';
import 'package:adv_basics/answer_btn.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAns, {super.key});

  final void Function(String ans) onSelectAns;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAns) {
    widget.onSelectAns(selectedAns);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 60, 224, 142),
        Color.fromARGB(255, 22, 230, 230)
      ])),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                // style: const TextStyle(color: Color.fromARGB(255, 27, 116, 96)),
                style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 27, 116, 96),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAns().map((item) {
                return AnswerButton(() {
                  answerQuestion(item);
                }, item);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
