import 'package:climate_forcast/services/weatherConditions.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {

  final weatherLocation;
  LocationScreen({this.weatherLocation});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  var temperatue;
  var condition;
  var cityName;
  String weatherIcon = '';
  String weatherMessage = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateWeather(widget.weatherLocation);
  }

  void updateWeather(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperatue = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to fetch data. Please check your connection';
        cityName = '';
        return;
      }
  temperatue = weatherData['main']['temp'];
  condition = weatherData['weather'][0]['id'];
  cityName = weatherData['name'];
  WeatherModel weatherModel = WeatherModel();
  weatherIcon = weatherModel.getWeatherIcon(condition);
  weatherMessage = weatherModel.getMessage(temperatue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
