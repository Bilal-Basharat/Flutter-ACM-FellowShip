import 'package:flutter/material.dart';
import 'package:navigation_routing_animation/Home_Screen.dart';
import 'package:navigation_routing_animation/Screen_2.dart';
import 'package:navigation_routing_animation/Screen_3.dart';
import 'package:navigation_routing_animation/TweenAnimation.dart';
import 'package:navigation_routing_animation/basicAnimate.dart';
import 'package:navigation_routing_animation/utilities/routesName.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => homeScreen());
      case RouteNames.basicAnimation:
        return MaterialPageRoute(builder: (context) => BasicAnimation());
      case RouteNames.tweenAnimation:
        return MaterialPageRoute(builder: (context) => TweenAnimation(data: settings.arguments as Map,));
      case RouteNames.screenTwo:
        return MaterialPageRoute(builder: (context) => ScreenTwo(data: settings.arguments as Map,));
      case RouteNames.screenThree:
        return MaterialPageRoute(builder: (context) => ScreenThree(data: settings.arguments as Map,));
      default:
        return MaterialPageRoute(builder:
        (context){
              return const Scaffold(
                body: Center(child: Text('No Route Defined')),
              );
        });
    }
  }
}