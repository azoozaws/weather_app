import 'package:weather_app/models/ModelOfListOfWeather.dart';

class WeatherState {}

class WatherInitialState extends WeatherState {}

class WeatherLodedState extends WeatherState {
  final ModelOfListOfWeather info;

  WeatherLodedState({required this.info});
}

class WeatherFailureState extends WeatherState {}
