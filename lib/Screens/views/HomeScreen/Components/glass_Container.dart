import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controler/Weather_provider.dart';

GlassmorphicContainer glassmorphicContainerTemp(
    double height, double width, WeatherProvider weatherProvider) {
  return GlassmorphicContainer(
    width: 350,
    height: 850,
    borderRadius: 20,
    blur: 20,
    padding: const EdgeInsets.all(40),
    alignment: Alignment.bottomCenter,
    border: 2,
    linearGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFFffffff).withOpacity(0.05),
        const Color(0xFFFFFFFF).withOpacity(0.05),
      ],
      stops: [0.1, 1],
    ),
    borderGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.transparent,
        Colors.transparent,
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 10,bottom: 10,right: 15),
            height: 110,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Today, ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Text(
                          "${weatherProvider.dateTime.day} June",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          weatherProvider.weather!.currentModal.tempC.toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ' / ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          weatherProvider.weather!.currentModal.feelsLikeC
                              .toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Rain',style: TextStyle(
                          color: Colors.white
                        ),)
                      ],
                    ),

                  ],
                ),
                Spacer(),
                Column(
                 children: [
                   SizedBox(
                     height: height * 0.05,
                     child: Image.network(
                       'https:${weatherProvider.weather!.currentModal.conditionModel.icon}',
                       fit: BoxFit.cover,
                     ),
                   ),
                 ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  weatherProvider.weather!.currentModal.tempC.toString(),
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 100),
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
          Text(
            weatherProvider.weather!.currentModal.conditionModel.text,
            style: GoogleFonts.overpass(color: Colors.white, fontSize: 22),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.air, color: Colors.white),
                    Text('Wind',
                        style: GoogleFonts.overpass(color: Colors.white)),
                    Text('|', style: GoogleFonts.overpass(color: Colors.white)),
                    Text(
                        '${weatherProvider.weather!.currentModal.windKph} Km/h',
                        style: GoogleFonts.overpass(color: Colors.white)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.water_drop_outlined, color: Colors.white),
                      Text('Hum',
                          style: GoogleFonts.overpass(color: Colors.white)),
                      Text('|',
                          style: GoogleFonts.overpass(color: Colors.white)),
                      Text(
                          '${weatherProvider.weather!.currentModal.humidity} %',
                          style: GoogleFonts.overpass(color: Colors.white)),
                      SizedBox(width: width * 0.000001),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
