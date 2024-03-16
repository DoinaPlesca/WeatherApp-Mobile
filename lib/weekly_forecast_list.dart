import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class WeeklyForecastList extends StatelessWidget {
  final WeeklyForecastDto weeklyForecast;

  const WeeklyForecastList({Key? key, required this.weeklyForecast})
      : super(key: key);

  String weekdayAsString(DateTime time) {
    switch (time.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }

  String getWeatherImageUrl(int weatherCode) {
    switch (WeatherCodeExtension.fromInt(weatherCode)) {
      case WeatherCode.rainShowersSlight:
        return 'assets/images/rain.png';
      case WeatherCode.partlyCloudy:
        return 'assets/images/cloudy-day.png';
      case WeatherCode.overcast:
        return 'assets/images/overcast.png';
      case WeatherCode.snowFallModerate:
        return 'assets/images/snow.png';
      case WeatherCode.rainModerate:
        return 'assets/images/rain.shower.png';
      case WeatherCode.rainSlight:
        return 'assets/images/rain.slight.intensity.png';
      default:
        return 'assets/images/default.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final daily = weeklyForecast.daily!;
          if (daily.time == null ||
              daily.weatherCode == null ||
              daily.temperature2MMax == null ||
              daily.temperature2MMin == null ||
              index >= daily.time!.length ||
              index >= daily.weatherCode!.length ||
              index >= daily.temperature2MMax!.length ||
              index >= daily.temperature2MMin!.length) {
            return Container(); // Placeholder widget or handle error accordingly
          }

          final date = DateTime.parse(daily.time![index]);
          final weatherCode =
              WeatherCodeExtension.fromInt(daily.weatherCode![index]);
          final tempMax = daily.temperature2MMax![index];
          final tempMin = daily.temperature2MMin![index];
          final weatherImageUrl = getWeatherImageUrl(daily.weatherCode![index]);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              elevation: 2,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(weatherImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weekdayAsString(date),
                            style: textTheme.headline6!.copyWith(
                              color: Colors.white, // Change color
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            weatherCode.description,
                            style: textTheme.subtitle1!.copyWith(
                              color: Colors.green, // Change color
                            ),
                          ),
                          Text(
                            'Max Temp: $tempMax°C',
                            style: textTheme.bodyText1!.copyWith(
                              color: Colors.red, // Change color
                            ),
                          ),
                          Text(
                            'Min Temp: $tempMin°C',
                            style: textTheme.bodyText1!.copyWith(
                              color: Colors.blue, // Change color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: weeklyForecast.daily?.time?.length ?? 0,
      ),
    );
  }
}
