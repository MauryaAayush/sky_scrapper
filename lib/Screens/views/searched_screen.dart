import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controler/Weather_provider.dart';
import 'HomeScreen/homeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedCitiesScreen extends StatelessWidget {
  const SavedCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Custom Header
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                'Saved Cities',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // List of Saved Cities
          Padding(
            padding: EdgeInsets.only(top: 80), // Adjust this value to fit below the header
            child: ListView.builder(
              itemCount: weatherProvider.savedCities.length,
              itemBuilder: (context, index) {
                final cityName = weatherProvider.savedCities[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    // tileColor: Colors.white.withOpacity(0.2),
                    title: Text(
                      cityName,
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.location_city, color: Colors.blueAccent),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(initialCity: cityName),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
