import 'package:flutter/material.dart';
import 'Networking.dart';
import 'location.dart';

const myAPIkey = '792b3112046da333c9045490b90e3465';

class WeatherModel {

  Future<dynamic> getWeatherByCityName(String cityName) async {
    print('city name is $cityName');

    Location location = Location();
    await location.getCurrentLocation();
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$myAPIkey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;

  }

  Future<dynamic> getWeatherLocation() async{
    Location location = Location();
    await location.getCurrentLocation();

    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$myAPIkey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Image getWeatherIcon(int condition) {
    if (condition < 300) {
      return Image.asset('assets/thunderstorm.png');
    } else if (condition < 400) {
      return Image.asset('assets/lightrain.png');
    } else if (condition < 600) {
      return Image.asset('assets/showers.png');
    } else if (condition < 700) {
      return Image.asset('assets/snow.png');
    } else if (condition < 800) {
      return Image.asset('assets/fogg.png');
    } else if (condition == 800) {
      return Image.asset('assets/clear.png');
    } else if (condition <= 804) {
      return Image.asset('assets/heavycloud.png');
    } else {
      return Image.asset('assets/clear.png');
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}