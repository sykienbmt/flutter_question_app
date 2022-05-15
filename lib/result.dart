import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuestion;
  const Result(this.totalScore,this.resetQuestion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Text(
            "Your Score is $totalScore",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          FlatButton(
            onPressed: resetQuestion,
            child: Text("Reset"),
            color: Colors.lightGreenAccent,
          )
        ],
      ),
    );
  }
}
