import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/Screens/controler/Weather_provider.dart';

import 'Screens/views/HomeScreen/homeScreen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => WeatherProvider(),)
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of<WeatherProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  Homescreen(weatherProvider: weatherProviderTrue),
    );
  }
}
