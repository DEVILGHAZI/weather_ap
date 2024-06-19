import 'package:weather_ap/forecast/model/hour_model.dart';
import 'package:weather_ap/homepage/bloc/model.dart';

class Day {
  Day({
    this.current,
    this.Hourly1,
    this.Hourly2,
    this.Hourly3,
    this.Hourly4,
    this.Hourly5,
    this.Hourly6,
    this.Hourly7,
    this.Hourly8,
    this.Hourly9,
    this.Hourly10,
    this.Hourly11,
    this.Hourly12,
    this.Hourly13,
    this.Hourly14,
    this.Hourly15,
    this.Hourly16,
    this.Hourly17,
    this.Hourly18,
    this.Hourly19,
    this.Hourly20,
    this.Hourly21,
    this.Hourly22,
    this.Hourly23,
    this.Hourly24,
    this.astro,
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  final Current? current;
  final HourlyWeather? Hourly1;
  final HourlyWeather? Hourly2;
  final HourlyWeather? Hourly3;
  final HourlyWeather? Hourly4;
  final HourlyWeather? Hourly5;
  final HourlyWeather? Hourly6;
  final HourlyWeather? Hourly7;
  final HourlyWeather? Hourly8;
  final HourlyWeather? Hourly9;
  final HourlyWeather? Hourly10;
  final HourlyWeather? Hourly11;
  final HourlyWeather? Hourly12;
  final HourlyWeather? Hourly13;
  final HourlyWeather? Hourly14;
  final HourlyWeather? Hourly15;
  final HourlyWeather? Hourly16;
  final HourlyWeather? Hourly17;
  final HourlyWeather? Hourly18;
  final HourlyWeather? Hourly19;
  final HourlyWeather? Hourly20;
  final HourlyWeather? Hourly21;
  final HourlyWeather? Hourly22;
  final HourlyWeather? Hourly23;
  final HourlyWeather? Hourly24;
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? totalsnowCm;
  final double? avgvisKm;
  final double? avgvisMiles;
  final int? avghumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final Condition? condition;
  final int? uv;
  final Astro? astro;

  // New getter to get the list of hourly weather
  List<HourlyWeather?> get hourly => [
        Hourly1,
        Hourly2,
        Hourly3,
        Hourly4,
        Hourly5,
        Hourly6,
        Hourly7,
        Hourly8,
        Hourly9,
        Hourly10,
        Hourly11,
        Hourly12,
        Hourly13,
        Hourly14,
        Hourly15,
        Hourly16,
        Hourly17,
        Hourly18,
        Hourly19,
        Hourly20,
        Hourly21,
        Hourly22,
        Hourly23,
        Hourly24,
      ];

  HourlyWeather? getHourlyWeather(int index) {
    switch (index) {
      case 1:
        return Hourly1;
      case 2:
        return Hourly2;
      case 3:
        return Hourly3;
      case 4:
        return Hourly4;
      case 5:
        return Hourly5;
      case 6:
        return Hourly6;
      case 7:
        return Hourly7;
      case 8:
        return Hourly8;
      case 9:
        return Hourly9;
      case 10:
        return Hourly10;
      case 11:
        return Hourly11;
      case 12:
        return Hourly12;
      case 13:
        return Hourly13;
      case 14:
        return Hourly14;
      case 15:
        return Hourly15;
      case 16:
        return Hourly16;
      case 17:
        return Hourly17;
      case 18:
        return Hourly18;
      case 19:
        return Hourly19;
      case 20:
        return Hourly20;
      case 21:
        return Hourly21;
      case 22:
        return Hourly22;
      case 23:
        return Hourly23;
      case 24:
        return Hourly24;
      default:
        return null;
    }
  }

  factory Day.fromJson(Map<String, dynamic> json) {
    var dayJson = json['forecastday'][0]['day'];
    List<dynamic> hours = json['forecastday'][0]['hour'];
    List<HourlyWeather> hourlyWeathers =
        hours.map((hour) => HourlyWeather.fromJson(hour)).toList();

    return Day(
      Hourly1: hourlyWeathers[0],
      Hourly2: hourlyWeathers[1],
      Hourly3: hourlyWeathers[2],
      Hourly4: hourlyWeathers[3],
      Hourly5: hourlyWeathers[4],
      Hourly6: hourlyWeathers[5],
      Hourly7: hourlyWeathers[6],
      Hourly8: hourlyWeathers[7],
      Hourly9: hourlyWeathers[8],
      Hourly10: hourlyWeathers[9],
      Hourly11: hourlyWeathers[10],
      Hourly12: hourlyWeathers[11],
      Hourly13: hourlyWeathers[12],
      Hourly14: hourlyWeathers[13],
      Hourly15: hourlyWeathers[14],
      Hourly16: hourlyWeathers[15],
      Hourly17: hourlyWeathers[16],
      Hourly18: hourlyWeathers[17],
      Hourly19: hourlyWeathers[18],
      Hourly20: hourlyWeathers[19],
      Hourly21: hourlyWeathers[20],
      Hourly22: hourlyWeathers[21],
      Hourly23: hourlyWeathers[22],
      Hourly24: hourlyWeathers[23],
      maxtempC: (dayJson['maxtemp_c'] as num?)?.toDouble(),
      maxtempF: (dayJson['maxtemp_f'] as num?)?.toDouble(),
      mintempC: (dayJson['mintemp_c'] as num?)?.toDouble(),
      mintempF: (dayJson['mintemp_f'] as num?)?.toDouble(),
      avgtempC: (dayJson['avgtemp_c'] as num?)?.toDouble(),
      avgtempF: (dayJson['avgtemp_f'] as num?)?.toDouble(),
      maxwindMph: (dayJson['maxwind_mph'] as num?)?.toDouble(),
      maxwindKph: (dayJson['maxwind_kph'] as num?)?.toDouble(),
      totalprecipMm: (dayJson['totalprecip_mm'] as num?)?.toDouble(),
      totalprecipIn: (dayJson['totalprecip_in'] as num?)?.toDouble(),
      totalsnowCm: (dayJson['totalsnow_cm'] as num?)?.toDouble(),
      avgvisKm: (dayJson['avgvis_km'] as num?)?.toDouble(),
      avgvisMiles: (dayJson['avgvis_miles'] as num?)?.toDouble(),
      avghumidity: (dayJson['avghumidity'] as num?)?.toInt(),
      dailyWillItRain: (dayJson['daily_will_it_rain'] as num?)?.toInt(),
      dailyChanceOfRain: (dayJson['daily_chance_of_rain'] as num?)?.toInt(),
      dailyWillItSnow: (dayJson['daily_will_it_snow'] as num?)?.toInt(),
      dailyChanceOfSnow: (dayJson['daily_chance_of_snow'] as num?)?.toInt(),
      condition: dayJson['condition'] != null
          ? Condition.fromJson(dayJson['condition'])
          : null,
      uv: (json['uv'] as num?)?.toInt() ?? 0,
      astro: json['forecastday'][0]['astro'] != null
          ? Astro.fromJson(json['forecastday'][0]['astro'])
          : null,
    );
  }
}

class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as int?,
    );
  }
}

class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final double? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moonPhase: json['moon_phase'] as String?,
      moonIllumination: (json['moon_illumination'] as num?)?.toDouble() ?? 0,
      isMoonUp: json['is_moon_up'] == true ? 1 : 0,
      isSunUp: json['is_sun_up'] == true ? 1 : 0,
    );
  }
  
}
