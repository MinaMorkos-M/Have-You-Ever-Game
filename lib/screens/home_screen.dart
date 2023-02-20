import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int yesCount = 0, questionNumber = 0;

  List<String> questions = [
    'Have you ever wrote a letter?',
    'Have you ever smoked a cigarette?',
    'Have you ever been hit on by someone who was too old?',
    'Have you ever been on the radio or on television?',
    'Have you ever stayed awake for an entire night?',
    'Have you ever broken something, like a window, and ran away?',
    'Have you ever won a contest and received a prize?',
    'Have you ever met a famous person or a celebrity?',
  ];

  final ButtonStyle yesButton = ElevatedButton.styleFrom(
    primary: Colors.green,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  final ButtonStyle noButton = ElevatedButton.styleFrom(
    primary: Colors.red,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  final ButtonStyle againButton = ElevatedButton.styleFrom(
    primary: Colors.grey,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Have You Ever'),
      ),
      body: Center(
        child: (questionNumber < 5)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    questions[questionNumber],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    child: Text('Yes'),
                    style: yesButton,
                    onPressed: () {
                      setState(() {
                        yesCount++;
                        questionNumber++;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('No'),
                    style: noButton,
                    onPressed: () {
                      setState(() {
                        questionNumber++;
                      });
                    },
                  ),
                ],
              )
            : Column(
                children: [
                  (yesCount > 2)
                      ? Image.asset('assets/images/loser.png')
                      : Image.asset('assets/images/winner.png'),
                  ElevatedButton(
                    child: Text('Again'),
                    style: againButton,
                    onPressed: () {
                      setState(() {
                        questionNumber = 0;
                        yesCount = 0;
                        questions.shuffle();
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
