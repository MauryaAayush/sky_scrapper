import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sky_scrapper/Screens/controler/helpers/api_services.dart';

import '../model/weatherData_Model.dart';


class WeatherProvider extends ChangeNotifier{
  Weather? weather;
  DateTime dateTime =DateTime.now();


  WeatherProvider()
  {
    fetchData();
  }

  Future<void> fetchData()
  async {
    ApiServices apiServices = ApiServices();
    String? jsonData = await apiServices.getData();
    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);
      print("Called successfully");
      print(jsonData);
      notifyListeners();
    }
  }
}