class Main {
  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.temMax,
  });
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num temMax;

  factory Main.fromJson(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as num,
      feelsLike: map['feelsLike'] as num,
      tempMin: map['tempMin'] as num,
      temMax: map['temMax'] as num,
    );
  }
}
