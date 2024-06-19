// import 'dart:convert';

// class HourlyWeather {
//   final int timeEpoch;
//   final String time;
//   final double tempC;
//   final double tempF;
//   final int isDay;
//   final Condition condition;
//   final double windMph;
//   final double windKph;
//   final int windDegree;
//   final String windDir;
//   final int pressureMb;
//   final double pressureIn;
//   final double precipMm;
//   final double precipIn;
//   final double snowCm;
//   final int humidity;
//   final int cloud;
//   final double feelslikeC;
//   final double feelslikeF;
//   final double windchillC;
//   final double windchillF;
//   final double heatindexC;
//   final double heatindexF;
//   final double dewpointC;
//   final double dewpointF;
//   final int willItRain;
//   final int chanceOfRain;
//   final int willItSnow;
//   final int chanceOfSnow;
//   final double visKm;
//   final double visMiles;
//   final double gustMph;
//   final double gustKph;
//   final int uv;

//   HourlyWeather({
//     required this.timeEpoch,
//     required this.time,
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windMph,
//     required this.windKph,
//     required this.windDegree,
//     required this.windDir,
//     required this.pressureMb,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.precipIn,
//     required this.snowCm,
//     required this.humidity,
//     required this.cloud,
//     required this.feelslikeC,
//     required this.feelslikeF,
//     required this.windchillC,
//     required this.windchillF,
//     required this.heatindexC,
//     required this.heatindexF,
//     required this.dewpointC,
//     required this.dewpointF,
//     required this.willItRain,
//     required this.chanceOfRain,
//     required this.willItSnow,
//     required this.chanceOfSnow,
//     required this.visKm,
//     required this.visMiles,
//     required this.gustMph,
//     required this.gustKph,
//     required this.uv,
//   });

//   factory HourlyWeather.fromJson(Map<String, dynamic> json) {
//     return HourlyWeather(
//       timeEpoch: json['time_epoch'] as int,
//       time: json['time'] as String,
//       tempC: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
//       tempF: (json['temp_f'] as num?)?.toDouble() ?? 0.0,
//       isDay: json['is_day'] as int,
//       condition: Condition.fromJson(json['condition']),
//       windMph: (json['wind_mph'] as num?)?.toDouble() ?? 0.0,
//       windKph: (json['wind_kph'] as num?)?.toDouble() ?? 0.0,
//       windDegree: json['wind_degree'] as int,
//       windDir: json['wind_dir'] as String,
//       pressureMb: json['pressure_mb'] as int,
//       pressureIn: (json['pressure_in'] as num?)?.toDouble() ?? 0.0,
//       precipMm: (json['precip_mm'] as num?)?.toDouble() ?? 0.0,
//       precipIn: (json['precip_in'] as num?)?.toDouble() ?? 0.0,
//       snowCm: (json['snow_cm'] as num?)?.toDouble() ?? 0.0,
//       humidity: json['humidity'] as int,
//       cloud: json['cloud'] as int,
//       feelslikeC: (json['feelslike_c'] as num?)?.toDouble() ?? 0.0,
//       feelslikeF: (json['feelslike_f'] as num?)?.toDouble() ?? 0.0,
//       windchillC: (json['windchill_c'] as num?)?.toDouble() ?? 0.0,
//       windchillF: (json['windchill_f'] as num?)?.toDouble() ?? 0.0,
//       heatindexC: (json['heatindex_c'] as num?)?.toDouble() ?? 0.0,
//       heatindexF: (json['heatindex_f'] as num?)?.toDouble() ?? 0.0,
//       dewpointC: (json['dewpoint_c'] as num?)?.toDouble() ?? 0.0,
//       dewpointF: (json['dewpoint_f'] as num?)?.toDouble() ?? 0.0,
//       willItRain: json['will_it_rain'] as int,
//       chanceOfRain: json['chance_of_rain'] as int,
//       willItSnow: json['will_it_snow'] as int,
//       chanceOfSnow: json['chance_of_snow'] as int,
//       visKm: (json['vis_km'] as num?)?.toDouble() ?? 0.0,
//       visMiles: (json['vis_miles'] as num?)?.toDouble() ?? 0.0,
//       gustMph: (json['gust_mph'] as num?)?.toDouble() ?? 0.0,
//       gustKph: (json['gust_kph'] as num?)?.toDouble() ?? 0.0,
//       uv: json['uv'] as int,
//     );
//   }

// }

// class Condition {
//   final String text;
//   final String icon;
//   final int code;

//   Condition({
//     required this.text,
//     required this.icon,
//     required this.code,
//   });

//   factory Condition.fromJson(Map<String, dynamic> json) {
//     return Condition(
//       text: json['text'] as String,
//       icon: json['icon'] as String,
//       code: json['code'] as int,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'text': text,
//       'icon': icon,
//       'code': code,
//     };
//   }
// }


import 'dart:convert';

class HourlyWeather {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final double snowCm;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  HourlyWeather({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      timeEpoch: json['time_epoch'] as int,
      time: json['time'] as String,
      tempC: (json['temp_c'] as num?)?.toDouble() ?? 0.0,
      tempF: (json['temp_f'] as num?)?.toDouble() ?? 0.0,
      isDay: json['is_day'] as int,
      condition: Condition.fromJson(json['condition']),
      windMph: (json['wind_mph'] as num?)?.toDouble() ?? 0.0,
      windKph: (json['wind_kph'] as num?)?.toDouble() ?? 0.0,
      windDegree: json['wind_degree'] as int,
      windDir: json['wind_dir'] as String,
      pressureMb: json['pressure_mb']?.toDouble()?? 0.0,
      pressureIn: (json['pressure_in'] as num?)?.toDouble() ?? 0.0,
      precipMm: (json['precip_mm'] as num?)?.toDouble() ?? 0.0,
      precipIn: (json['precip_in'] as num?)?.toDouble() ?? 0.0,
      snowCm: (json['snow_cm'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int,
      cloud: json['cloud'] as int,
      feelslikeC: (json['feelslike_c'] as num?)?.toDouble() ?? 0.0,
      feelslikeF: (json['feelslike_f'] as num?)?.toDouble() ?? 0.0,
      windchillC: (json['windchill_c'] as num?)?.toDouble() ?? 0.0,
      windchillF: (json['windchill_f'] as num?)?.toDouble() ?? 0.0,
      heatindexC: (json['heatindex_c'] as num?)?.toDouble() ?? 0.0,
      heatindexF: (json['heatindex_f'] as num?)?.toDouble() ?? 0.0,
      dewpointC: (json['dewpoint_c'] as num?)?.toDouble() ?? 0.0,
      dewpointF: (json['dewpoint_f'] as num?)?.toDouble() ?? 0.0,
      willItRain: json['will_it_rain'] as int,
      chanceOfRain: json['chance_of_rain'] as int,
      willItSnow: json['will_it_snow'] as int,
      chanceOfSnow: json['chance_of_snow'] as int,
      visKm: (json['vis_km'] as num?)?.toDouble() ?? 0.0,
      visMiles: (json['vis_miles'] as num?)?.toDouble() ?? 0.0,
      gustMph: (json['gust_mph'] as num?)?.toDouble() ?? 0.0,
      gustKph: (json['gust_kph'] as num?)?.toDouble() ?? 0.0,
      uv: json['uv']?.toDouble()??0.0,
    );
  }

  get first => null;
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
      'code': code,
    };
  }
}

List<HourlyWeather> parseHourlyWeather(String jsonString) {
  final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
  return parsed.map<HourlyWeather>((json) => HourlyWeather.fromJson(json)).toList();
}
