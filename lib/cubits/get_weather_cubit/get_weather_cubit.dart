import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/ModelOfListOfWeather.dart';
import 'package:weather_app/service/requestApi.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WatherInitialState());
  ModelOfListOfWeather? info;
  getWeather({required String cityName}) async {
    try {
      info =
          await RequestApi(Dio()).getWeather(city: cityName);
      emit(WeatherLodedState(info: info!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
