import 'question.dart';

class QuesSet {
  int _questionNumber = 0;
  //List to store ques and there ans
  List<Question> _questionBank = [
    Question(ques: 'There are 10 zeros in the number 1 million.', ans: false),
    Question(ques: 'The square root of 100 is five.', ans: false),
    Question(ques: 'Water is also called H2O.', ans: true),
    Question(ques: 'Fish sleep with their eyes closed.', ans: true),
    Question(
        ques:
            'If you mix all the colors of the rainbow together, you get white.',
        ans: true),
  ];

  //to be used in setState() to update the question text
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  //to fetch question text from _questionBank
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  //to fetch answer from _questionBank
  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  // check if quiz ended
  bool isFinished() {
    if (_questionNumber < _questionBank.length - 1) {
      return false;
    } else {
      _reset();
      return true;
    }
  }

  //reset _questionNumber to 0
  void _reset() {
    _questionNumber = 0;
  }
}
