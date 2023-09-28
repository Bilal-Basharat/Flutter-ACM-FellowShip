import 'dart:ffi';
import 'package:climate_forcast/screens/city_screen.dart';
import 'package:climate_forcast/services/weatherConditions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  int feel = 0;
  var condition;
  var cityName;
  Image? weatherIcon;
  String weatherMessage = '';
  String weekDay = '';
  String humidity = '';
  String pressure = '';
  String dewPoint = '';
  String feels_like = '';
  String country  = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // String weekDay = '';
    updateWeather(widget.weatherLocation);
  }

  //getting month of the week
  String monthOfTheWeek(int month){
    if(month == 1){
      return 'January';
    }else if(month == 2){
      return 'February';
    }else if(month == 3){
      return 'March';
    }else if(month == 4){
      return 'April';
    }else if(month == 5){
      return 'May';
    }else if(month == 6){
      return 'June';
    }else if(month == 7){
      return 'July';
    }else if(month == 8){
      return 'August';
    }else if(month == 9){
      return 'September';
    }else if(month == 10){
      return 'October';
    }else if(month == 11){
      return 'November';
    }else if(month == 12){
      return 'December';
    }
    return '';
  }


  void updateWeather(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperatue = 0;
        weatherIcon = Image.asset('assets/unknown.png');
        weatherMessage = 'Unable to fetch data. Please check your connection';
        cityName = '';
        feels_like = '';
         humidity = '';
         pressure = '';
         dewPoint = '';
         country  = '';
        return;
      }
  temperatue = weatherData['main']['temp'];
      feel = weatherData['main']['feels_like'].toInt();
   intTemp = temperatue.toInt();
  condition = weatherData['weather'][0]['id'];
  cityName = weatherData['name'];
  humidity = weatherData['main']['humidity'].toString();
  pressure = weatherData['main']['pressure'].toString();
  dewPoint = weatherData['wind']['deg'].toString();
      country  = weatherData['sys']['country'].toString();
  feels_like = feel.toString();
      WeatherModel weatherModel = WeatherModel();
  weatherIcon = weatherModel.getWeatherIcon(condition);
  // weatherMessage = weatherModel.getMessage(intTemp);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.cyanAccent.shade100 , Colors.cyanAccent.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.7, 1.0],

          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          var weatherDataUpdated = await WeatherModel().getWeatherLocation();
                          updateWeather(weatherDataUpdated);
                          },
                        child:  Image(image: AssetImage('assets/updateLoc.png'),
                          width: 40.0,),
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
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(DateTime.now().day.toString() + 'th, ' +monthOfTheWeek(DateTime.now().month)
                      + ', ' + DateTime.now().hour.toString() + ' : ' + DateTime.now().minute.toString()  ,
                    style: TextStyle(fontSize: 20, color: Colors.amber.shade500),),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 25.0, top: 25),
                  child: Row(
                    children: <Widget>[
                      Text(
                        intTemp.toString() + ' \u00B0C ',
                        style: kTempTextStyle,
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 100,
                        child: weatherIcon,
                      ),
                      ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text('Feels like $feels_like \u00B0 ', style: iconsColorStyle,),
                ),

                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/sleet.png'), width: 40,),
                          SizedBox(width: 150),
                          Text('$humidity%', style: iconsColorStyle,),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/pressure1.png'), width: 40,),
                          SizedBox(width: 150),
                          Text('$pressure mBar', style: iconsColorStyle,),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/dew-point.png'),
                            width: 40.0,),
                          SizedBox(width: 150),
                          Text('$dewPoint \u00B0C ', style: iconsColorStyle,),
                        ],
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      "$cityName, $country",
                      style: TextStyle(fontSize: 40, color: Colors.blue.shade500, letterSpacing: 10),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
