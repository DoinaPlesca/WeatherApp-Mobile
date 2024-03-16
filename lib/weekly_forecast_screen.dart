import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather_sliver_app_bar.dart';
import 'package:weather/weekly_forecast_list.dart';
import 'data_source.dart';
import 'models.dart';

class WeeklyForecastScreen extends StatefulWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  _WeeklyForecastScreenState createState() => _WeeklyForecastScreenState();
}

class _WeeklyForecastScreenState extends State<WeeklyForecastScreen> {
  late final StreamController<WeeklyForecastDto> _controller;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<WeeklyForecastDto>();
    loadForecast();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Future<void> loadForecast() async {
    final future = context.read<DataSource>().getWeeklyForecast();
    await _controller.addStream(future.asStream());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<WeeklyForecastDto>(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return CustomScrollView(
              slivers: [
                WeatherSliverAppBar(
                  headerImage: '',
                  onRefresh: loadForecast, // Pass loadForecast as onRefresh callback
                ),
                WeeklyForecastList(weeklyForecast: snapshot.data!),
              ],
            );
          } else {
            return const Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}
