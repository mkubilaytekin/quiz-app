import 'question.dart';

class QuizBrain{
  int _index = 0;

  final _questionList = <Question>[
    Question('Türkiye\'nin başkenti Ankara.', true),
    Question('İzmir Ege Bölgesinde.', true),
    Question('İstanbul\'un plakası 35', false),
    Question('Ankara\'nın plakası 34', false)
  ];

  void nextQuestion(){
    if(_index < _questionList.length - 1){
      _index ++;
    }
  }

  String getQuestionText() {
    return _questionList[_index].questionText;
  }

  bool getQuestionAnswer() {
    return _questionList[_index].questionAnswer;
  }

  bool isFinished(){
    if(_index >= _questionList.length - 1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _index = -1;
  }
}
