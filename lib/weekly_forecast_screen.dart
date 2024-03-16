import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather_sliver_app_bar.dart';
import 'package:weather/weekly_forecast_list.dart';

import 'data_source.dart';
import 'models.dart';

class WeeklyForecastScreen extends StatelessWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<DataSource>().getWeeklyForecast(),
        builder: (context, AsyncSnapshot<WeeklyForecastDto> snapshot) {
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
                const WeatherSliverAppBar(headerImage: '',),
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


/*
class WeeklyForecastScreen extends StatelessWidget {
  const WeeklyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<DataSource>().getWeeklyForecast(),
        builder: (context, snapshot) {
          return CustomScrollView(
            slivers: <Widget>[
              const WeatherSliverAppBar(),
              if (snapshot.hasData)
                WeeklyForecastList(weeklyForecast: snapshot.data!)
              else if (snapshot.hasError)
                buildError(snapshot, context)
              else
                buildSpinner()
            ],
          );
        },
      ),
    );
  }

  Widget buildError(Object? error, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          error.toString(),
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }

  Widget buildSpinner() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}*/
