import 'package:flutter/material.dart';
import 'package:navigation_routing_animation/utilities/routesName.dart';
import 'Screen_2.dart';

class homeScreen extends StatefulWidget {

  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('This is Home Screen'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RouteNames.screenTwo,
                      arguments: {
                      'name': 'Bilal',
                        'sem' : 5,
                      },
                  );
      },
                child: Container(
                          height: 50,
                          width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Navigate to Screen Two',
                        style: TextStyle(
                            color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ),
            ],
          ),
      ),
    );
  }
}
