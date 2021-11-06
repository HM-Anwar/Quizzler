import 'package:flutter/material.dart';
import './quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBrain quizBrain = QuizBrain();


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
 
  List<Icon> score =  [];
  
   void chooseAns(bool pickAns){
   bool getans = quizBrain.getAnswer();
   setState(() {
     if (quizBrain.isFinished()==true){
        Alert(context: context,
            title: "The Quiz is Finished",
            desc: "Reseting"
         ).show();   
       quizBrain.reset();
        score=[];
     }
     else {
       quizBrain.nextQuestion();
     }
      if(pickAns==getans)
      {
        score.add(Icon(Icons.check,
        color:Colors.green,));
      }
      else{
        score.add(Icon(Icons.close,
        color: Colors.red,),);
      }
   });
   
   
   }

        
 

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
                chooseAns(true);
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
                chooseAns(false);
              },
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}
