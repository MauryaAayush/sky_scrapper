import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  static final ApiServices apiservice = ApiServices._singleton();

  ApiServices._singleton();

  Future<String?> getData(String? query)
  async {
    String finalQuery = query?.isNotEmpty == true ? query! : 'Surat';
    String apiData =
        'https://api.weatherapi.com/v1/forecast.json?key=f86c4361d8984109b63103038241906&q=$finalQuery';
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      print('Api Called');
      return response.body;
    }
  return null;
  }
}
