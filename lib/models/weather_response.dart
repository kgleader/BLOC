import 'dart:convert';
import 'package:weather_bloc/models/weather.dart';
import 'main_model.dart';

class WeatherResponse {
  const WeatherResponse({
    required this.weather,
    required this.main,
    required this.name,
  });

  final List<Weather> weather;
  final Main main;
  final String name;

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      weather: List<Weather>.from(
        (map['weather'] as List<int>).map<Weather>(
          (x) => Weather.fromJson(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromJson(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
