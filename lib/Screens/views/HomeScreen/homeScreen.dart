import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controler/Weather_provider.dart';
import 'Components/glass_Container.dart';
import 'Components/weather app bar.dart';
import 'Components/weather_image.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key, required this.weatherProvider});

  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Determine the background image based on the weather condition
    String backgroundImage = 'assets/rain.gif'; // Default image
    if (weatherProvider.weather != null) {
      String condition = weatherProvider.weather!.currentModal.conditionModel.text.toLowerCase();
      if (condition.contains('partly cloudy')) {
        backgroundImage = 'assets/cloudthunder.gif'; // Replace with your partly cloudy image path
      } else if (condition.contains('rain')) {
        backgroundImage = 'assets/rain.gif'; // Replace with your rain image path
      }
      // Add more conditions as needed
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: (weatherProvider.weather == null)
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              children: [
                wetherAppBar(width),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        weatherImage(height, weatherProvider),
                        glassmorphicContainerTemp(height, width, weatherProvider),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


