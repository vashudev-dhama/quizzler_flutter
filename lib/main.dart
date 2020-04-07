import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //to track question number
  int questionIndex = 0;

  //list of icons as per score
  List<Icon> scoreIcons = [];

  //list of questions
  List<String> questions = [
    'ques 1',
    'ques 2',
    'ques 3',
    'ques 4',
  ];

  void addIcon(bool userAnswer) {
    if (userAnswer == answers[questionIndex])
      scoreIcons.add(Icon(Icons.check, color: Colors.green));
    else
      scoreIcons.add(Icon(Icons.close, color: Colors.red));
  }

  //list of respective answers
  List<bool> answers = [
    true,
    false,
    false,
    true,
  ];

  //to build function of same type
  Expanded buildBoolButton(String text, Color color, bool userAnswer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlatButton(
          onPressed: () {
            addIcon(userAnswer);
            setState(() {
              questionIndex++;
            });
            print('button pressed');
          },
          color: color,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questions[questionIndex],
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        buildBoolButton('True', Colors.green, true),
        buildBoolButton('False', Colors.red, false),
        Row(
          children: scoreIcons,
        ),
      ],
    );
  }
}
