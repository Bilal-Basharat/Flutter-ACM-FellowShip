import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade800,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/PROFILE PIC.png'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text('Bilal Basharat',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
                  ,),
                const SizedBox(
                  height: 5,
                ),
                Text('Flutter Developer',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18,
                    letterSpacing: 5,
                  )
                  ,),
                SizedBox(
                  height: 30.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade200,
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                    color: Colors.teal,),
                    title: Text("+92 304 260 23 60",
                      style: TextStyle(color: Colors.teal.shade800),
                    ),
                  ),

                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,),
                    title: Text("bilalbisharat@gmail.com",
                      style: TextStyle(color: Colors.teal.shade800),
                    ),
                  ),

                ),
              ],
            ),
          )
        )
      )
    );
  }
}
