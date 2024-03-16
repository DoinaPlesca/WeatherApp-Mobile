import 'dart:convert';

import 'package:flutter/services.dart';

import 'models.dart';
import 'package:http/http.dart' as http;

abstract class DataSource {
  Future<WeeklyForecastDto> getWeeklyForecast();
}

class FakeDataSource extends DataSource {
  @override
  Future<WeeklyForecastDto> getWeeklyForecast() async {
    final json = await rootBundle.loadString("assets/daily_weather.json");
    return WeeklyForecastDto.fromJson(jsonDecode(json));
  }
}

/*class RealDataSource extends DataSource {
  final String apiUrl;

  RealDataSource(this.apiUrl);

  @override
  Future<WeeklyForecastDto> getWeeklyForecast() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeeklyForecastDto.fromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}*/

/*
abstract class DataSource {
  Future<WeeklyForecastDto> getWeeklyForecast();
}

class FakeDataSource extends DataSource {
  @override
  Future<WeeklyForecastDto> getWeeklyForecast() async {
    final json = await rootBundle.loadString("assets/daily_weather.json");
    return WeeklyForecastDto.fromJson(jsonDecode(json));
  }
}*/
