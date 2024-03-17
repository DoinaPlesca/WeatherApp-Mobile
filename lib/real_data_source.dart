import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather/time_series.dart';
import 'data_source.dart';
import 'models.dart';

class RealDataSource extends DataSource {

  @override
  Future<WeeklyForecastDto> getWeeklyForecast() async {
  final location = await Location.instance.getLocation();
  final apiUrl =
  'https://api.open-meteo.com/v1/forecast?latitude=${location.latitude}&longitude=${location.longitude}&daily=weather_code,temperature_2m_max,temperature_2m_min&wind_speed_unit=ms&timezone=Europe%2FBerlin';
  final response = await http.get(Uri.parse(apiUrl));
  return WeeklyForecastDto.fromJson(jsonDecode(response.body));
  }



  @override
  Future<WeatherChartData> getChartData() async {
    const apiUrl = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m,rain&daily=temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin";
    final response = await http.get(Uri.parse(apiUrl));
    return WeatherChartData.fromJson(jsonDecode(response.body));
  }

}