class WeeklyForecastDto {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation; // Change to double
  DailyUnits? dailyUnits;
  Daily? daily;

  WeeklyForecastDto({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation, // Change to double
    this.dailyUnits,
    this.daily,
  });

  factory WeeklyForecastDto.fromJson(Map<String, dynamic> json) {
    return WeeklyForecastDto(
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      generationtimeMs: json['generationtime_ms'] as double?,
      utcOffsetSeconds: json["utc_offset_seconds"] as int?,
      timezone: json['timezone'] as String?,
      timezoneAbbreviation: json['timezone_abbreviation'] as String?,
      elevation: json['elevation'] != null
          ? json['elevation'].toDouble()
          : null,
      dailyUnits: json['daily_units'] != null
          ? DailyUnits.fromJson(json['daily_units'])
          : null,
      daily: json['daily'] != null ? Daily.fromJson(json['daily']) : null,
    );
  }
}

class Daily {
  List<String>? time;
  List<int>? weatherCode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;

  Daily({
    this.time,
    this.weatherCode,
    this.temperature2MMax,
    this.temperature2MMin,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: json['time'] != null ? List<String>.from(json['time']) : null,
      weatherCode: json['weather_code'] != null
          ? List<int>.from(json['weather_code'])
          : null,
      temperature2MMax: json['temperature_2m_max'] != null
          ? List<double>.from(json['temperature_2m_max'])
          : null,
      temperature2MMin: json['temperature_2m_min'] != null
          ? List<double>.from(json['temperature_2m_min'])
          : null,
    );
  }
}

class DailyUnits {
  String? time;
  String? weatherCode;
  String? temperature2MMax;
  String? temperature2MMin;

  DailyUnits({
    this.time,
    this.weatherCode,
    this.temperature2MMax,
    this.temperature2MMin,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json['time'] as String?,
      weatherCode: json['weather_code'] as String?,
      temperature2MMax: json['temperature_2m_max'] as String?,
      temperature2MMin: json['temperature_2m_min'] as String?,
    );
  }
}

enum WeatherCode {
  clearSky,
  mainlyClear,
  partlyCloudy,
  overcast,
  fog,
  depositingRimeFog,
  drizzleLight,
  drizzleModerate,
  drizzleDense,
  freezingDrizzleLight,
  freezingDrizzleDense,
  rainSlight,
  rainModerate,
  rainHeavy,
  freezingRainLight,
  freezingRainHeavy,
  snowFallSlight,
  snowFallModerate,
  snowFallHeavy,
  snowGrains,
  rainShowersSlight,
  rainShowersModerate,
  rainShowersVoilent,
  snowShowersSlight,
  snowShowersHeavy,
  thunerstorm,
  thunderstormSlightHail,
  thunderstormHeavyHail,
}

extension WeatherCodeExtension on WeatherCode {
  int get value {
    switch (this) {
      case WeatherCode.clearSky:
        return 0;
      case WeatherCode.mainlyClear:
        return 1;
      case WeatherCode.partlyCloudy:
        return 2;
      case WeatherCode.overcast:
        return 3;
      case WeatherCode.fog:
        return 45;
      case WeatherCode.depositingRimeFog:
        return 48;
      case WeatherCode.drizzleLight:
        return 51;
      case WeatherCode.drizzleModerate:
        return 53;
      case WeatherCode.drizzleDense:
        return 55;
      case WeatherCode.freezingDrizzleLight:
        return 56;
      case WeatherCode.freezingDrizzleDense:
        return 57;
      case WeatherCode.rainSlight:
        return 61;
      case WeatherCode.rainModerate:
        return 63;
      case WeatherCode.rainHeavy:
        return 65;
      case WeatherCode.freezingRainLight:
        return 66;
      case WeatherCode.freezingRainHeavy:
        return 66;
      case WeatherCode.snowFallSlight:
        return 71;
      case WeatherCode.snowFallModerate:
        return 73;
      case WeatherCode.snowFallHeavy:
        return 75;
      case WeatherCode.snowGrains:
        return 77;
      case WeatherCode.rainShowersSlight:
        return 80;
      case WeatherCode.rainShowersModerate:
        return 81;
      case WeatherCode.rainShowersVoilent:
        return 82;
      case WeatherCode.snowShowersSlight:
        return 85;
      case WeatherCode.snowShowersHeavy:
        return 86;
      case WeatherCode.thunerstorm:
        return 95;
      case WeatherCode.thunderstormSlightHail:
        return 96;
      case WeatherCode.thunderstormHeavyHail:
        return 99;
    }
  }

  String get description {
    switch (this) {
      case WeatherCode.clearSky:
        return 'Clear sky';
      case WeatherCode.mainlyClear:
        return 'Mainly clear';
      case WeatherCode.partlyCloudy:
        return 'Partly cloudy';
      case WeatherCode.overcast:
        return 'Overcast';
      case WeatherCode.fog:
        return 'Fog';
      case WeatherCode.depositingRimeFog:
        return 'Depositing rime fog';
      case WeatherCode.drizzleLight:
        return 'Drizzle: Light intensity';
      case WeatherCode.drizzleModerate:
        return 'Drizzle: Moderate intensity';
      case WeatherCode.drizzleDense:
        return 'Drizzle: Dense intensity';
      case WeatherCode.freezingDrizzleLight:
        return 'Freezing Drizzle: Light intensity';
      case WeatherCode.freezingDrizzleDense:
        return 'Freezing Drizzle: Dense intensity';
      case WeatherCode.rainSlight:
        return 'Rain: Slight intensity';
      case WeatherCode.rainModerate:
        return 'Rain: Moderate intensity';
      case WeatherCode.rainHeavy:
        return 'Rain: Heavy intensity';
      case WeatherCode.freezingRainLight:
        return 'Freezing Rain: Light intensity';
      case WeatherCode.freezingRainHeavy:
        return 'Freezing Rain: Heavy intensity';
      case WeatherCode.snowFallSlight:
        return 'Snow fall: Slight intensity';
      case WeatherCode.snowFallModerate:
        return 'Snow fall: Moderate intensity';
      case WeatherCode.snowFallHeavy:
        return 'Snow fall: Heavy intensity';
      case WeatherCode.snowGrains:
        return 'Snow grains';
      case WeatherCode.rainShowersSlight:
        return 'Rain showers: Slight';
      case WeatherCode.rainShowersModerate:
        return 'Rain showers: Moderate';
      case WeatherCode.rainShowersVoilent:
        return 'Rain showers: Violent';
      case WeatherCode.snowShowersSlight:
        return 'Snow showers: Slight';
      case WeatherCode.snowShowersHeavy:
        return 'Snow showers: Heavy';
      case WeatherCode.thunerstorm:
        return 'Thunderstorm: Slight or moderate';
      case WeatherCode.thunderstormSlightHail:
        return 'Thunderstorm with slight hail';
      case WeatherCode.thunderstormHeavyHail:
        return 'Thunderstorm with heavy hail';
    }
  }

  static WeatherCode fromInt(int value) {
    switch (value) {
      case 0:
        return WeatherCode.clearSky;
      case 1:
        return WeatherCode.mainlyClear;
      case 2:
        return WeatherCode.partlyCloudy;
      case 3:
        return WeatherCode.overcast;
      case 45:
        return WeatherCode.fog;
      case 48:
        return WeatherCode.depositingRimeFog;
      case 51:
        return WeatherCode.drizzleLight;
      case 53:
        return WeatherCode.drizzleModerate;
      case 55:
        return WeatherCode.drizzleDense;
      case 56:
        return WeatherCode.freezingDrizzleLight;
      case 57:
        return WeatherCode.freezingDrizzleDense;
      case 61:
        return WeatherCode.rainSlight;
      case 63:
        return WeatherCode.rainModerate;
      case 65:
        return WeatherCode.rainHeavy;
      case 66:
        return WeatherCode.freezingRainLight; // Adjust if needed
      case 71:
        return WeatherCode.snowFallSlight;
      case 73:
        return WeatherCode.snowFallModerate;
      case 75:
        return WeatherCode.snowFallHeavy;
      case 77:
        return WeatherCode.snowGrains;
      case 80:
        return WeatherCode.rainShowersSlight;
      case 81:
        return WeatherCode.rainShowersModerate;
      case 82:
        return WeatherCode.rainShowersVoilent;
      case 85:
        return WeatherCode.snowShowersSlight;
      case 86:
        return WeatherCode.snowShowersHeavy;
      case 95:
        return WeatherCode.thunerstorm; // Adjust if needed
      case 96:
        return WeatherCode.thunderstormSlightHail; // Adjust if needed
      case 99:
        return WeatherCode.thunderstormHeavyHail; // Adjust if needed
      default:
        throw ArgumentError('Invalid WeatherCode value: $value');
    }
  }

}