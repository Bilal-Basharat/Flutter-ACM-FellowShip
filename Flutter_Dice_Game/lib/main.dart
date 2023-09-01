import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: Center(child: Text("Dice App")),
            backgroundColor: Colors.blue.shade800,
          ),
          body: DiceApp(),
        ),
      ));
}

class DiceApp extends StatefulWidget {
  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  String result = "Click on any dice";

  //function for generating random numbers for left and right dice
  void changeDiceFace(){
    setState((){
      leftDiceNumber = Random().nextInt(5) + 1;
      rightDiceNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 50,
    ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Click on Any Dice",
            style:       TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
           ),
          ],),

        SizedBox(
          height: 100,
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child:TextButton(
                  onPressed: (){
                    changeDiceFace();
                  },
                  child: Image.asset(
                      'images/dice$leftDiceNumber.png'),
                ),
              ),

          Expanded(
            child: TextButton(
              onPressed: (){
                changeDiceFace();
    },
              child: Image.asset(
                  'images/dice$rightDiceNumber.png'),
            ),),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(leftDiceNumber > rightDiceNumber)
              Text("Player 1 Wins",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,),)
            else if(rightDiceNumber > leftDiceNumber)
              Text("Player 2 Wins",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  fontSize: 36,),)
            else
              Text("Draw",
                style:
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  fontSize: 36,),)
          ],),
      ],
    );
  }
}