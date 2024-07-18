// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../model/weatherData_Model.dart';
// import 'helpers/api_services.dart';
//
// class WeatherProvider extends ChangeNotifier {
//   Weather? weather;
//   DateTime dateTime = DateTime.now();
//   bool isLoading = false;
//   List<String> savedCities = [];
//
//   WeatherProvider() {
//     fetchData('Surat');
//     loadSavedCities();
//   }
//
//   Future<void> fetchData(String query) async {
//     isLoading = true;
//     notifyListeners();
//
//     String? jsonData = await ApiServices.apiservice.getData(query);
//
//     if (jsonData != null) {
//       Map dataList = jsonDecode(jsonData);
//       weather = Weather.getData(dataList);
//       print("Called successfully");
//       print(jsonData);
//
//       // Save the city name to SharedPreferences
//       await saveCityToPreferences(query);
//
//       isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   Future<void> saveCityToPreferences(String city) async {
//     final prefs = await SharedPreferences.getInstance();
//     savedCities.add(city);
//     await prefs.setStringList('saved_cities', savedCities);
//   }
//
//   Future<void> loadSavedCities() async {
//     final prefs = await SharedPreferences.getInstance();
//     savedCities = prefs.getStringList('saved_cities') ?? [];
//     notifyListeners();
//   }
// }
//
//


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/weatherData_Model.dart';
import 'helpers/api_services.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  DateTime dateTime = DateTime.now();
  bool isLoading = false;
  List<String> savedCities = [];

  WeatherProvider() {
    fetchData('Surat');
    loadSavedCities();
  }

  Future<void> fetchData(String query) async {
    isLoading = true;
    notifyListeners();

    String? jsonData = await ApiServices.apiservice.getData(query);

    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print("Called successfully");
      print(jsonData);

      // Save the city name to SharedPreferences
      await saveCityToPreferences(query);

      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveCityToPreferences(String city) async {
    final prefs = await SharedPreferences.getInstance();
    if (!savedCities.contains(city)) {
      savedCities.add(city);
      await prefs.setStringList('saved_cities', savedCities);
    }
  }

  Future<void> loadSavedCities() async {
    final prefs = await SharedPreferences.getInstance();
    savedCities = prefs.getStringList('saved_cities') ?? [];
    notifyListeners();
  }

  Weather? getWeatherDetailsForCity(String cityName) {
    // Replace with your actual logic to fetch weather details
    if (weather != null && weather!.locationModal.name == cityName) {
      return weather;
    }
    return null;
  }
}

