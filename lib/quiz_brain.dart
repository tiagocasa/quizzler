import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionList = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: true),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: false),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: true),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: false),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: true),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: false),
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: true),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: false),
  ];

  void NextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber == _questionList.length) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  String getQuestionText() => _questionList[_questionNumber].questionText;

  bool getQuestionAnswer() => _questionList[_questionNumber].questionAnswer;
}
