import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_source.dart';
import 'models.dart';

class RealDataSource extends DataSource {

  @override
  Future<WeeklyForecastDto> getWeeklyForecast() async {
    const url = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Europe%2FBerlin";
    final response = await http.get(Uri.parse(url));
    final map = json.decode(response.body);
    return WeeklyForecastDto.fromJson(map);
  }

}