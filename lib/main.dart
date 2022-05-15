import 'package:flutter/material.dart';
import 'package:flutter_1/result.dart';
import './quiz.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  bool isEnd = false;
  var questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 20},
        {'text': 'Red', 'score': 15},
        {'text': 'Green', 'score': 25},
        {'text': 'White', 'score': 30}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Elephant', 'score': 5},
        {'text': 'Tiger', 'score': 10},
        {'text': 'Snake', 'score': 25},
        {'text': 'Dragon', 'score': 15}
      ],
    },
    {
      'questionText': 'Who\'s your favorite language?',
      'answers': [
        {'text': 'VietNamese', 'score': 25},
        {'text': 'Japanese', 'score': 15},
        {'text': 'Chinese', 'score': 10},
        {'text': 'Americano', 'score': 5}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex = _questionIndex + 1;
        isEnd = false;
      });
      print(_questionIndex);
    } else {
      setState(() {
        isEnd = true;
      });
    }
  }

  void _resetQuestion() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      isEnd = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My First App'),
          ),
          body: isEnd == false
              ? Quiz(
                  questions: questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion)
              : Result(_totalScore,_resetQuestion)),
    );
  }
}
