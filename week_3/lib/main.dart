import 'package:flutter/material.dart';

// The main function is the starting point for all our flutter apps
void main() {
runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('This is navbar'),
        centerTitle: true,
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              transform: Matrix4.rotationX(.2),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              decoration:
              BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://images.pexels.com/photos/271639/pexels-photo-271639.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                  width: 5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 10,
                  ),
                ]
              ),
              child: Center(
                  child: Text('this is container that contains some text')
              ),
              ),

            ),
        ],
      ),
    ),
  ),);
}