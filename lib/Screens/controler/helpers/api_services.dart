import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<String?> getData() async {
    String apiData =
        'https://api.weatherapi.com/v1/current.json?key=f86c4361d8984109b63103038241906&q=surat';
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);
    if (response.statusCode == 200) {
      print('Api Called');
      return response.body;
    } else {
      return null;
    }
  }

}