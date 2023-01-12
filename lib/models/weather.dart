class Weather {
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  static fromJson(Map<String, dynamic> x) {}
}
