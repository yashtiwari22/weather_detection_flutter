import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_detection_app/screens/city_screen.dart';
import 'package:weather_detection_app/utilities/constants.dart';
import 'package:weather_detection_app/services/weather.dart';

// ignore: use_key_in_widget_constructors
class LocationScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  LocationScreen({this.locationWeather});

  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String message = "";
  String cityName = "";
  String weatherIcon = "";

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        message = 'Error 404';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      message = weather.getMessage(temperature);

      cityName = weatherData['name'];

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 32.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () async {
                        var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityScreen();
                            },
                          ),
                        );
                        if (typedName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedName);
                          updateUI(weatherData);
                        }
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      const Text(
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Text(
                      '$message in $cityName !',
                      textAlign: TextAlign.center,
                      style: kMessageTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
