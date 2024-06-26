import 'currentData_Model.dart';
import 'locationData_Model.dart';

class Weather {
  LocationModal locationModal;

  CurrentModal currentModal;

  Weather({required this.locationModal, required this.currentModal});

  factory Weather.getData(Map json) {
    return Weather(
        locationModal: LocationModal.getData(json['location']),
        currentModal: CurrentModal.fromJson(json['current']));
  }
}
