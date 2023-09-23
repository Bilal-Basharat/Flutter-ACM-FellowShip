import 'package:flutter/material.dart';

class Constants{
  final Color backGroundColor = const Color(0xff5CD2E6);
  final Color primaryColor = const Color(0xff3085C3);
  final Color secondaryColor = const Color(0xff90B2F8);
}

class City{
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;

  City({
   required this.isSelected,
   required this.city,
   required this.country,
   required this.isDefault
});

  //list of cities

}