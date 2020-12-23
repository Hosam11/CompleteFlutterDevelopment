import 'package:flutter/material.dart';
import 'package:quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quizzler());
}

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeepers = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: buildFlatButton(
              name: 'True',
              backgroundColor: Colors.green,
              onPressed: () {
                checkAnswer(true);
              }),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: buildFlatButton(
                name: 'False',
                backgroundColor: Colors.red,
                onPressed: () {
                  checkAnswer(false);
                }),
          ),
        ),
        Row(
          children: scoreKeepers,
        )
      ],
    );
  }

  void checkAnswer(bool userCheckedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scoreKeepers.clear();
      } else {
        if (correctAnswer == userCheckedAnswer) {
          print('answer true');
          scoreKeepers.add(Icon(Icons.check, color: Colors.green));
        } else {
          print('answer false');
          scoreKeepers.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  FlatButton buildFlatButton(
      {String name, Color backgroundColor, Function onPressed}) {
    return FlatButton(
      textColor: Colors.white,
      color: backgroundColor,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
