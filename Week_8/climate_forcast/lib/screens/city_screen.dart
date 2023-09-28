import 'package:flutter/material.dart';
import '../models/constants.dart';
import 'package:searchfield/searchfield.dart';


class CityWeather extends StatefulWidget {
  const CityWeather({super.key});

  @override
  State<CityWeather> createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {
  final focus = FocusNode();
  String cityName = '';
  final ScrollController _searchController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Climate Forecast'),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        // width: double.infinity,
        // height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            const Padding(
                padding: EdgeInsets.all(20),
            child: Text('Select City from the list', style:
            TextStyle(color: Colors.blue, fontSize: 20 ),)
              ,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [ BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0,10)
                ),],
              ),

              child: SearchField(

                hint: 'Search', searchStyle: TextStyle(color: Colors.blueGrey),
                searchInputDecoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey.shade200,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.withOpacity(0.8),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                itemHeight: 50,
                maxSuggestionsInViewPort: cities.length,
                suggestionsDecoration: SuggestionDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),

                suggestions: cities.map((String e) => SearchFieldListItem<String>(e,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(e,
                      style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent.withOpacity(0.75))),
                ),
                )
                ).toList(),
                focusNode: focus,
                suggestionState: Suggestion.expand,
                onSuggestionTap: (item) {
                  cityName = item.searchKey.toString();
                  Navigator.pop(context, cityName);
                  focus.unfocus();
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}