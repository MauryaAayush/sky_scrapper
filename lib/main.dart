import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/Screens/controler/Weather_provider.dart';

import 'Screens/views/HomeScreen/homeScreen.dart';
import 'Screens/views/splashScreen.dart';
import 'Screens/views/testingscreen.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: WeatherPage(),
      home:  Splashscreen(),
    );
  }
}
