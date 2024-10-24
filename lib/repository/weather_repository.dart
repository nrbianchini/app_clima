import 'dart:convert';
import 'dart:developer';

import 'package:app_clima/models/weather.dart';
import 'package:http/http.dart' as http;

const apiUrl =
    "https://api.hgbrasil.com/weather?key=0f62eab8&city_name=Ourinhos,SP";

class ClimateRepository {
  Future<Weather?> getWeatherData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode != 200) {
        throw Exception("There was an error while trying to reach the data.");
      }

      final json = jsonDecode(response.body);
      final weather = Weather.fromJson(json["results"]);

      return weather;
    } catch (err) {
      log(err.toString());
      return null;
    }
  }
}
