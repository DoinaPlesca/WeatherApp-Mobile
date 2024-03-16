import 'dart:convert';
import 'package:http/http.dart' as http;

import 'data_source.dart';
import 'models.dart';


class RealDataSource extends DataSource {
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
}
