import 'package:weather_detection_app/services/location.dart';
import 'package:weather_detection_app/services/networking.dart';

const apikey = 'ca51da9df29041835675ba9aef176509';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apikey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherDataCity = await networkHelper.getData();

    return weatherDataCity;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

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
    } else if (temp >= 20) {
      return 'Time for shorts and 👕';
    } else if (temp <= 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
