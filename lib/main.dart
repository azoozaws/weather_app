import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return Builder(
            builder: (context) => MaterialApp(
              theme: ThemeData(
                primarySwatch: getColorForWeatherCondition(
                  BlocProvider.of<GetWeatherCubit>(context).info?.state,
                ),
              ),
              home: const HomeView(),
            ),
          );
        },
      ),
    );
  }
}

MaterialColor getColorForWeatherCondition(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
    case 'Overcast':
      return Colors.lightBlue;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
      return Colors.blueGrey;
    case 'Light rain':
    case 'Moderate rain at times':
      return Colors.purple;
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.indigo;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.lime;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.amber;
    case 'Ice pellets':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
      return Colors.red;
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
      return Colors.lightGreen;
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.blue;
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
      return Colors.purple;
    default:
      return Colors.green;
  }
}
