import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controler/Weather_provider.dart';
import 'HomeScreen/homeScreen.dart';


class SavedCitiesScreen extends StatelessWidget {
  const SavedCitiesScreen({super.key});

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Homescreen(initialCity: cityName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
