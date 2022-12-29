import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'Your Open Weather API Key';

class NetworkHelper {
  final Map<String, dynamic> defaultParams = {
    'appid': apiKey,
    'units': 'metric',
  };
  final Map<String, dynamic> queryParameters;
  NetworkHelper(this.queryParameters);

  Future<dynamic> getData() async {
    queryParameters.addEntries(defaultParams.entries);
    http.Response response = await http.get(Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters));

    // https://api.openweathermap.org/data/2.5/weather?lat=37.33233141&lon=-122.0312186&appid=c8ffa13ff0153912d686b744ded8f77a
    print(response.request.url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
