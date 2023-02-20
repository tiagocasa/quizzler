import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'answer_track.dart';

QuizBrain quizBrain = QuizBrain();
AnswerTrack answerTrack = AnswerTrack();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  CheckAnswer(true);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    CheckAnswer(false);
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: answerTrack.getAnswerList(),
        )
      ],
    );
  }

  void CheckAnswer(bool userAnswer) {
    answerTrack.CheckAnswer(
      userAnswer,
      quizBrain.getQuestionAnswer(),
    );
    if (quizBrain.isFinished()) {
      int correctAnswer = answerTrack.getCorrectAnswerCount();
      Alerta(correctAnswer);
    } else {
      quizBrain.NextQuestion();
    }
  }

  void Alerta(int correctAnswer) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Quiz Finished",
      desc: "You've got $correctAnswer correct answers.",
      buttons: [
        DialogButton(
            child: Text(
              "Restart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              120;
              (setState(() {
                quizBrain.Reset();
                answerTrack.Reset();
              }));
            })
      ],
    ).show();
  }
}
