import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/question_Summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAns});

  final List<String> choosenAns;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_ans': questions[i].ans[0],
        'use_ans': choosenAns[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestiions = summaryData.where((data) {
      return data['use_ans'] == data['correct_ans'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestiions out of $numTotalQuestions answers correctly',
              style: TextStyle(
                  fontSize: 27,
                  color: Color.fromARGB(255, 21, 92, 77),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            questionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_right_rounded),
                label: const Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
