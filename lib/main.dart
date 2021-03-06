import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<Icon> scoreKeeper = [];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];

  int questionNumber = 0;

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
                questions[questionNumber],
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
            child: FlatButton(
              textColor: Colors.white,
              color: Color(0xFF97cc04),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Text(
                'True'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Color(0xFF97cc04),
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Color(0xFFe03616),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0)),
              child: Text(
                'False'.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Color(0xFFe03616),
                    ),
                  );
                });
              },
            ),
          ),
        ),
        //Add Score Keeper
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              direction: Axis.horizontal,
              children: scoreKeeper,
            ),
          ),
        )
      ],
    );
  }
}
/*
* question1: 'You can lead a cow down stairs but not up stairs.', false,
* question2: 'Approximately one quarter of human bones are in the feet.', true,
* question3: 'A slug\'s blood is green.'. true,
* */
