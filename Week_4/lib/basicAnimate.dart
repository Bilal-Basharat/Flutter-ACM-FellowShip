import 'package:flutter/material.dart';
import 'package:navigation_routing_animation/utilities/routesName.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation({super.key});

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {

  //variables for use in animation
  double _opacity = 1;
  double _width = 200;
  double _margin = 20;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          margin: EdgeInsets.all(_margin),
          width: _width,
          color: _color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //animation for margins
              ElevatedButton(
                child: const Text('change Margin'),
              onPressed: () => setState(() => _margin = 50),
              ),

              //animation for width change
              ElevatedButton(
                child: const Text('Change Width'),
                onPressed: () => setState(() => _width = 400),
              ),

              //animation for color variation
              ElevatedButton(
                child:const  Text('Change Color'),
                onPressed: () => setState(() => _color = Colors.black),
              ),

              //settings for opacity variation
              AnimatedOpacity(
                  opacity: _opacity, duration: const Duration(seconds: 2),
              child:const  Text('Hide me', style: TextStyle(color:Colors.white))
              ),

              //animation for opacity variation
              ElevatedButton(
                child: const Text('Animate Opacity'),
                onPressed: () => setState(() => _opacity = 0),
              ),
              InkWell(
                onTap: () {
                      Navigator.pushNamed(context, RouteNames.tweenAnimation,
                        arguments:{
                        'name': 'Tween Animation',
                        },
                      );
                },
                child: Container(
                  width: 180,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: const Text('Tween Animation Screen',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red) ,),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
