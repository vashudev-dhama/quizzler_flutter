import 'package:flutter/material.dart';
import 'ques_set.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuesSet quesSet = new QuesSet();

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
  //list of icons as per score
  List<Icon> scoreIcons = [];

  //track user score
  int userScore = 0;

  //function to add icon to score list
  void addScoreIcon(bool userAnswer) {
    //correct answer
    if (userAnswer == quesSet.getCorrectAnswer()) {
      userScore++;
      scoreIcons.add(Icon(Icons.check, color: Colors.green));
    }
    //incorrect answer
    else {
      scoreIcons.add(Icon(Icons.close, color: Colors.red));
    }
  }

  //new checking answer method
  void checkAnswer(bool userAnswer) {
    setState(() {
      //add score icon as per user answer
      addScoreIcon(userAnswer);
      //if quiz is finished
      if (quesSet.isFinished()) {
        //pop-up an alert to show the end of quiz
        Alert(
          context: context,
          title: "Finished!",
          desc: "Quiz ended",
          content: Text('Your score is $userScore'),
        ).show();
        //clear the score and score icons
        scoreIcons.clear();
        userScore = 0;
      } else {
        //change the question
        quesSet.nextQuestion();
      }
    });
  }

  //to build function of same type
  Expanded buildBoolButton(String text, Color color, bool userAnswer) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FlatButton(
          onPressed: () {
            checkAnswer(userAnswer);
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
        //display question text
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quesSet.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        //display true button
        buildBoolButton('True', Colors.green, true),
        //display false button
        buildBoolButton('False', Colors.red, false),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreIcons,
        ),
      ],
    );
  }
}
