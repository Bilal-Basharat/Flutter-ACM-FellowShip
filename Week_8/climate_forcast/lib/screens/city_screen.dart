import 'package:flutter/material.dart';

import '../models/constants.dart';


class CityWeather extends StatefulWidget {
  const CityWeather({super.key});

  @override
  State<CityWeather> createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {

  String cityName = '';
  TextEditingController cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select City'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: cityNameController,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: textFieldInputDecation,
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
              onPressed: (){
                cityName = cityNameController.text;
                Navigator.pop(context, cityName);
          }, child: Text('Get Location', style: kButtonTextStyle,))
        ],
      ),
    );
  }
}
