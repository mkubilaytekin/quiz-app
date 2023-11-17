import 'package:flutter/material.dart';
import 'package:joinwin_quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
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
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> iconList = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {

      if(quizBrain.isFinished() == true){
        Alert(
          context: context,
          title: "Test bitti",
          desc: "Yeniden başlamak için tıklayın",
        ).show();
        quizBrain.reset();
        iconList = [];
      }else{
        if(userPickedAnswer == correctAnswer){
          iconList.add(const Icon(Icons.check, color: Colors.green,));
        }else{
          iconList.add(const Icon(Icons.close, color: Colors.red,));
        }
      }
    });
    quizBrain.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Center(
                  child: Text(quizBrain.getQuestionText(),
          style: const TextStyle(color: Colors.white, fontSize: 24),
          textAlign: TextAlign.center,
        )),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("True", style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("False", style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
        ),
        Row(
          children: iconList,
        )
      ],
    );
  }
}
