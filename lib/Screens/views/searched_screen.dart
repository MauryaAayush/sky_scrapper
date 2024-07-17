import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controler/Weather_provider.dart';

class SavedCitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Cities'),
      ),
      body: ListView.builder(
        itemCount: weatherProvider.savedCities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(weatherProvider.savedCities[index]),
          );
        },
      ),
    );
  }
}
