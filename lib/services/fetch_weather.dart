import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_bloc/constants/api_const.dart';

import '../models/weather_response.dart';

class WeatherService {
  final client = http.Client();

  //[cityName] alyp, oshol shaardyn aba yrayin beretS
  Future<WeatherResponse?> getWeatherByCityName(String cityName) async {
    //[uri] bir uri tusup aldyk
    final uri = Uri.parse(ApiConst.weatherByCityName(cityName));
    try {
      /// bir en pointke request jiberip jatat
      final response = await client.get(uri);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final weather = WeatherResponse.fromJson(response.body);
        return weather;
      } else {
        log('response.statusCode = ${response.statusCode}');
      }
    } catch (e) {
      log('getWeatherByCityName metoddo bir kata: $e');
      return null;
    }
  }
}

final weatherService = WeatherService();
  //koldonuuchudan shaardyn atyn alat
    //anan bir ssylka Uri tuzot
    //uri ge request jiberet
    //rekelgen jooptun (response) status codun teksheret
    //status kod 200 je 201 bolso, model kaitarat
    //andai bolboso , t.e bir kata bolso null kaitarat