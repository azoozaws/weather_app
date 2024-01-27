import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/ModelOfListOfWeather.dart';

// ignore: must_be_immutable
class WeatherInfoBody extends StatelessWidget {
  ModelOfListOfWeather info;
  WeatherInfoBody({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getColorForWeatherCondition(info.state)[400]!,
              getColorForWeatherCondition(info.state)[300]!,
              getColorForWeatherCondition(info.state)[200]!,
              getColorForWeatherCondition(info.state)[100]!,
              getColorForWeatherCondition(info.state)[50]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                info.city,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'updated at ${info.dateTime.hour}:${info.dateTime.minute}',
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    "https:${info.imageOfState}",
                  ),
                  Text(
                    '${info.degree.round()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp: ${info.maxDegree.round()}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mintemp: ${info.minDegree.round()}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                info.state,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
