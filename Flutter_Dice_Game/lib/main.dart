import 'package:flutter/material.dart';

void main() {
  return runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Center(child: Text("Dice App")),
            backgroundColor: Colors.deepOrange,
          ),
          body: DiceApp(),
        ),
      ));
}

class DiceApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
