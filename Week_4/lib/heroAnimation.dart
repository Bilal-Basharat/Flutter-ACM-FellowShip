import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
              child: Hero(
                tag: 'background',
                child: Image.asset('assets/images/flutter_logo.png', width: 300, height: 300,),
              )
          )
        ],
      ),
    );
  }
}
