import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/weatherData_Model.dart';
import 'helpers/api_services.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  DateTime dateTime = DateTime.now();
  bool isLoading = false;
  WeatherProvider() {
    fetchData('Surat');
  }

  Future<void> fetchData(String query) async {

    isLoading = true;
    notifyListeners();

    // String? jsonData = await apiservice.getData(query);
    String? jsonData = await ApiServices.apiservice.getData(query);

    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print("Called successfully");
      print(jsonData);


      isLoading = false;
      notifyListeners();
    }
  }
}
