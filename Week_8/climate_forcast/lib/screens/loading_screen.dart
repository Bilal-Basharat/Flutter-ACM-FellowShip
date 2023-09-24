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

  @override
  void initState(){
    super.initState();
    getLocation();
  }
  void getLocation() async {

    var weatherData = await WeatherModel().getWeatherLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context)
        {
        return LocationScreen(weatherLocation: weatherData);
        }));
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 200.0,
          ),
        ),
      );
  }
}
