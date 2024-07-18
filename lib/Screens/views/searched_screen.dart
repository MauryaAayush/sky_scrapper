import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controler/Weather_provider.dart';
import 'cityDetailedScreen.dart';


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
          final cityName = weatherProvider.savedCities[index];
          return ListTile(
            title: Text(cityName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CityDetailScreen(cityName: cityName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
