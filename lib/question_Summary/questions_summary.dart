import 'package:adv_basics/question_Summary/summary_item.dart';
import 'package:flutter/widgets.dart';
import 'package:adv_basics/result_screen.dart';

class questionSummary extends StatelessWidget {
  const questionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return SummaryItem(data);
        }).toList()),
      ),
    );
  }
}
