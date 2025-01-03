import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_viwe.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchViwe();
                    },
                  ),
                );
                const SearchViwe();
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WatherInitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLodedState) {
              return WeatherInfoBody(
                info: state.info,
              );
            } else {
              return const Center(
                  child: Text(
                "Opps there is an error 😔",
                style: TextStyle(fontSize: 24),
              ));
            }
          },
        ));
  }
}
