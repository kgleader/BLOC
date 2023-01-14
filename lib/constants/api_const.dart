class ApiConst {
  static get https => null;

  static String weatherByCityName(String name) =>
      // 'https://api.openweathermap.org/data/2.5/weather?q=$name,&appid=eb33022d526cb8afa13bd41f2414710b';
      // 'https://api.openweathermap.org/data/2.5/weather?q=$name&units=metric&appid=eb33022d526cb8afa13bd41f2414710b';
      //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=eb33022d526cb8afa13bd41f2414710b;

      'https://api.openweathermap.org/data/2.5/weather?q=$name,&appid=41aa18abb8974c0ea27098038f6feb1b';
}
