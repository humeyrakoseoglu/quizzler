import 'package:flutter/material.dart';
import 'package:quizzler/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
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
  const QuizPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int truecount = 0;
  int falsecount = 0;

  void checkAnswer(bool pickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.finished() == true) {
        Alert(
          context: context,
          title: "Quiz Bitti",
          desc:
              "Şimdi tekrar oyna. \nDoğru sayısı: $truecount\nYanlış sayısı: $falsecount",
        ).show();
        quizBrain.resetQuestion();
        scoreKeeper.clear();
        truecount = 0;
        falsecount = 0;
      } else {
        if (pickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
          truecount++;
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
          falsecount++;
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "SORU ${quizBrain.getQuestionNumber() + 1}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: const Color.fromARGB(255, 87, 150, 88),
              child: const Text(
                'DOĞRU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                Scaffold.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  backgroundColor: Color.fromARGB(255, 177, 26, 15),
                  content: Text(
                    textAlign: TextAlign.center,
                    quizBrain.getQuestionTrueAnswer(),
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ));
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Color.fromARGB(255, 143, 64, 59),
              child: const Text(
                'YANLIŞ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                Scaffold.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  backgroundColor: Color.fromARGB(255, 177, 26, 15),
                  content: Text(
                    textAlign: TextAlign.center,
                    quizBrain.getQuestionTrueAnswer(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ));
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
