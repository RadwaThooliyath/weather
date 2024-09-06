class Weather {
  final double tempC;
  final double tempF;
  final int humidity;
  final double windKph;
  final String condition;
  final double uv;

  Weather({
    required this.tempC,
    required this.tempF,
    required this.humidity,
    required this.windKph,
    required this.condition,
    required this.uv,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      tempC: json['current']['temp_c'],
      tempF: json['current']['temp_f'],
      humidity: json['current']['humidity'],
      windKph: json['current']['wind_kph'],
      condition: json['current']['condition']['text'],
      uv: json['current']['uv'],
    );
  }
}