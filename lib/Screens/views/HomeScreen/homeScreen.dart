import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controler/Weather_provider.dart';
import '../searched_screen.dart';
import 'Components/glass_Container.dart';
import 'Components/weather app bar.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key, this.initialCity});

  final String? initialCity;

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context, listen: true);
    TextEditingController searchController = TextEditingController();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Fetch weather data for the initial city if provided
    if (initialCity != null && initialCity!.isNotEmpty) {
      weatherProvider.fetchData(initialCity!);
    }

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
                wetherAppBar(context, width),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.5),
                              hintText: 'Enter city name',
                              prefixIcon: Icon(Icons.location_city, color: Colors.blueGrey),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.search, color: Colors.blueGrey),
                                onPressed: () async {
                                  weatherProvider.fetchData(searchController.text);
                                  searchController.clear();
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                            ),
                            onSubmitted: (value) async {
                              weatherProvider.fetchData(value);
                              searchController.clear();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 280,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                weatherProvider.weather!.currentModal.tempC.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 80,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 5, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        glassmorphicContainerTemp(height, width, weatherProvider),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SavedCitiesScreen(),
                              ),
                            );
                          },
                          child: Text('View Saved Cities'),
                        ),
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
