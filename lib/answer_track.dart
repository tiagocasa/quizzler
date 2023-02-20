import 'package:flutter/material.dart';

class AnswerTrack {
  List<Icon> _scoreKeeper = [];
  int _correctAnswerCount = 0;

  void CheckAnswer(bool userPickedAnswer, bool correctAnswer) {
    if (correctAnswer == userPickedAnswer) {
      _CorrectAnswer();
    } else {
      _WrongAnswer();
    }
  }

  void _CorrectAnswer() {
    _scoreKeeper.add(
      Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
    _correctAnswerCount++;
  }

  void _WrongAnswer() {
    _scoreKeeper.add(
      Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  void Reset() {
    _scoreKeeper = [];
    _correctAnswerCount = 0;
  }

  List<Icon> getAnswerList() => _scoreKeeper;
  int getCorrectAnswerCount() => _correctAnswerCount;
}
