import 'package:flutter/material.dart';
import './question.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int index = 0;
  void click() {
    setState(() {
      if (index < questionBank.length - 1) {
        index++;
      } else {
        questionBank.last;
      }
    });
  }
  void Fclick() {
    setState(() {
      if(index!=0)
      {
      index --;
      }
      else
      {
        questionBank.first;
      }
    });
  }

  List<Icon> check = const [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];
  List<Question> questionBank = [
    Question("Some cats are actually allergic to humans", true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                questionBank[index].questionText,
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
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: const Text(
                "True",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                click();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: const Text(
                "False",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                Fclick();
              },
            ),
          ),
        ),
        Row(
          children: check,
        )
      ],
    );
  }
}
