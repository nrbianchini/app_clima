import 'dart:async';

import 'package:app_clima/models/weather.dart';
import 'package:app_clima/repository/weather_repository.dart';

class WeatherController {
  final ClimateRepository _repository;
  WeatherController(this._repository);

  final _streamController = StreamController<Weather>();
  Sink<Weather> get inputEvent => _streamController.sink;
  Stream<Weather> get outputEvent => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  Future<void> getWeatherData() async {
    Weather? data = await _repository.getWeatherData();

    if (data == null) {
      return;
    }
    inputEvent.add(data);
  }
}
