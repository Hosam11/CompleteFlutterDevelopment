import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '591bcd4631db0416d6d78754e669845a';
const unitsMeasure = 'metric';
const weatherUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  /// return the weather data by given city name
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$weatherUrl?q=$cityName&appid=$apiKey&units=$unitsMeasure';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  /// return the current location of user device
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('long= ${location.longitude} - lat= ${location.latitude}');
    String url =
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=$unitsMeasure';

    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
