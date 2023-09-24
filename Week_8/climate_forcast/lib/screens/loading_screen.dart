import 'dart:convert';
import 'package:climate_forcast/screens/location_screen.dart';
import 'package:climate_forcast/services/Networking.dart';
import 'package:climate_forcast/services/weatherConditions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_forcast/models/constants.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  bool isLoading = false; //Tracking the loading state
  bool isImageVisible = true;
  double imageWidth = 0.0;
  double imageHeight = 0.0;
  double spacing = 0.0;
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    // Start the image animation
    animateScreen();
  }

  void animateScreen() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        imageWidth = 200.0;
        imageHeight = 200.0;
        opacity = 1.0;
        spacing = 10.0;
      });

    });
  }

  void getLocation() async {
setState(() {
  isLoading = true;
  isImageVisible = false;
});
var weatherData = await WeatherModel().getWeatherLocation();

Navigator.push(context, MaterialPageRoute(builder: (context)
{
  return LocationScreen(weatherLocation: weatherData);
}));
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body:
        Container(
          color: Colors.blue.shade400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: !isLoading,
                child: Column(
                  children: [
                    Text('Welcome to \n',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: spacing,
                        fontFamily: 'Sans Serif',
                      ),),
                    Text('Climate Forcast',
                      style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,
                        fontFamily: 'Sans Serif',
                      ),),
              SizedBox(height: 100),
                  ],
                ),
              ),

              Visibility(
                visible: !isLoading,
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 2), // Animation duration
                      curve: Curves.easeInOut, // Animation curve
                      height: imageWidth,
                      width: imageHeight,
                      child: Center(
                        child: Image.asset(
                          'assets/appstore.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              SizedBox(height: 150),
                  ],
                ),
              ),
              Visibility(
                visible: !isLoading,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      getLocation();
      });
                  },

                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue.shade800.withOpacity(opacity),
                        boxShadow: [
                          BoxShadow(
                          color: Colors.blue.shade400.withOpacity(1), // Shadow color
                          spreadRadius: 1, // How far the shadow should spread
                          blurRadius: 5, // The radius of the blur effect
                          offset: Offset(0, 0), // Offset of the shadow
                        ),
                        ]
                      ),
                      height: 50,
                      width: 250,
                      child: Center(child: Text('Get Started',
                          style: TextStyle(color: Colors.white.withOpacity(opacity),fontSize: 20))),
                    ),
                  ),
                ),
              ),
              if(isLoading)
              Container(
                child: SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 200.0,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
