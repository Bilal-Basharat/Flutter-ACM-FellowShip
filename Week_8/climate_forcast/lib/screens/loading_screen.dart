import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_forcast/models/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {

    Constants myConstants = Constants();
      Size size = MediaQuery.of(context).size;

      return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: myConstants.backGroundColor.withOpacity(1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/get-started.png'),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const Welcome()));
                },
                child: Container(
                  width: size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                    color: myConstants.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: const Center(
                    child: Text('Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 18),),
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
