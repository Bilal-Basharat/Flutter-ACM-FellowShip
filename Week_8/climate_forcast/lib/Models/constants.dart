import 'package:flutter/material.dart';

class Constants{
  final Color backGroundColor = const Color(0xff5CD2E6);
  final Color primaryColor = const Color(0xff3085C3);
  final Color secondaryColor = const Color(0xff90B2F8);
}

const kTempTextStyle =
TextStyle(
  fontFamily: 'RobotoMono',
  fontSize: 100.0,
  color: Color(0xff13C7D8),
  fontWeight: FontWeight.w100,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

var textFieldInputDecation = InputDecoration(
filled: true,
fillColor: Colors.white,
icon: Icon(
Icons.location_city,
  color: Colors.white,
),
  hintText: 'Enter City Name',
hintStyle: TextStyle(color: Colors.grey),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none,
),
);

//list of cities to show their weather
final List<String> cities = [
'New York',
  'New York',
  'Tokyo',
  'Delhi',
  'Beijing',
  'Paris',
  'Rome',
  'Lagos',
  'Amsterdam',
  'Barcelona',
  'Vienna',
  'Berlin',
  'Toronto',
  'Brussels',
  'Nairobi',
  'Karachi',
  'Lahore',
  'Islamabad',
  'Multan',
  'Hyderabad',
  'Bahawalpur',
  'Quetta',
  'Jacobabad',
'Los Angeles',
'Chicago',
'Houston',
'Miami',
// Add more cities as needed
];