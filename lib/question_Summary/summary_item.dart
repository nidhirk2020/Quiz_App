import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/question_Summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['use_ans'] == itemData['correct_ans'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'].toString(),
                  style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 18, 92, 82),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(itemData['use_ans'].toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 119, 69, 199),
                    )),
                Text(itemData['correct_ans'].toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 70, 141, 132),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
