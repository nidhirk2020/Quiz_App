import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.onTap, this.ans, {super.key});

  final String ans;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            backgroundColor: const Color.fromARGB(255, 2, 150, 118),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(
          ans,
          textAlign: TextAlign.center,
        ));
  }
}
