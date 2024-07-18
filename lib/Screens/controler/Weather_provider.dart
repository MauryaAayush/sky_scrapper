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
  bool isFetchingData = false; // Track if data is being fetched

  WeatherProvider() {
    loadSavedCities().then((_) {
      fetchData('Surat');
    });
  }

  Future<void> fetchData(String query) async {
    // Prevent multiple API calls
    if (isFetchingData) return;

    isFetchingData = true;
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
    }

    isLoading = false;
    isFetchingData = false;
    notifyListeners();
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
    // Check if weather data is available and matches the requested city
    if (weather != null && weather!.locationModal.name.toLowerCase() == cityName.toLowerCase()) {
      return weather;
    }
    return null;
  }
}
