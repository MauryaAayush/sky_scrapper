import 'package:flutter/material.dart';
import 'HomeScreen/homeScreen.dart';  // Import your Homescreen

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen(initialCity: 'Surat')),  // Provide the necessary parameters for Homescreen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/splash.gif')), // Replace with your image path
      ),
    );
  }
}
