import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
      MaterialApp(
        home: Scaffold(p
          appBar: AppBar(
            title: Center(child: Text("Dice App")),
            backgroundColor: Colors.deepOrange,
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

  //function for generating random numbers for left and right dice  
  void changeDiceFace(){
    setState((){
      leftDiceNumber = Random().nextInt(5) + 1;
      rightDiceNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child:TextButton(
              onPressed: (){

              },
              child: Image.asset(
                  'images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: (){
              setState((){
              leftDiceNumber = Random().nextInt(5) + 1;
              rightDiceNumber = Random().nextInt(5) + 1;
              });
    },
              child: Image.asset(
                  'images/dice$rightDiceNumber.png'),
            ),),
        ],
      ),
    );
  }
}