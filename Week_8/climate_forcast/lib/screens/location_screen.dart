import 'package:climate_forcast/screens/city_screen.dart';
import 'package:climate_forcast/services/weatherConditions.dart';
import 'package:flutter/material.dart';

import '../models/constants.dart';

class LocationScreen extends StatefulWidget {

  final weatherLocation;
  LocationScreen({this.weatherLocation});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  double temperatue = 0.00;
  int intTemp = 0;
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
   intTemp = temperatue.toInt();
  condition = weatherData['weather'][0]['id'];
  cityName = weatherData['name'];
  WeatherModel weatherModel = WeatherModel();
  weatherIcon = weatherModel.getWeatherIcon(condition);
  weatherMessage = weatherModel.getMessage(intTemp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherDataUpdated = await WeatherModel().getWeatherLocation();
                      updateWeather(weatherDataUpdated);
                      },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var updatedCityName = await Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)
                      {
                        return CityWeather();
                      }));
                      if(updatedCityName != null){
                        var cityWeatherData = await WeatherModel().getWeatherByCityName(updatedCityName);
                        updateWeather(cityWeatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      intTemp.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
