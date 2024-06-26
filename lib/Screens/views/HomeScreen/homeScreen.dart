import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controler/Weather_provider.dart';
import 'Components/glass_Container.dart';
import 'Components/report_button.dart';
import 'Components/weather app bar.dart';
import 'Components/weather_image.dart';


class Homescreen extends StatelessWidget {
  Homescreen({super.key, required this.weatherProvider});

  WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    WeatherProvider weatherProviderFalse =
    Provider.of<WeatherProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.21, -0.98),
            end: Alignment(0.21, 0.98),
            colors: [Color(0xFF47BFDF), Color(0xFF4A91FF)],
          ),
        ),
        child: SafeArea(
          child: (weatherProvider.weather == null)
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                wetherAppBar(width),
                weatherImage(height, weatherProvider),
                glassmorphicContainerTemp(height, width, weatherProvider),

              ],
            ),
          ),
        ),
      ),
    );
  }
}