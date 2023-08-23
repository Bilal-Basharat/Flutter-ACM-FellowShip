import 'package:flutter/material.dart';
import 'package:navigation_routing_animation/Screen_3.dart';
import 'package:navigation_routing_animation/utilities/routesName.dart';

class ScreenTwo extends StatefulWidget {
  dynamic data;
  ScreenTwo({Key? key,
    required this.data,
    }) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            widget.data['name'],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              InkWell(
              onTap: (){
        Navigator.pushNamed(context, RouteNames.screenThree, arguments: {
          'name': 'Screen_3',
        });
        },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'This is Screen 2',
                      style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
