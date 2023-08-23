import 'package:flutter/material.dart';
import 'package:navigation_routing_animation/Screen_2.dart';
import 'package:navigation_routing_animation/Screen_3.dart';
import 'package:navigation_routing_animation/basicAnimate.dart';
import 'package:navigation_routing_animation/utilities/Routes.dart';
import 'package:navigation_routing_animation/utilities/routesName.dart';
import 'Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.basicAnimation,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
