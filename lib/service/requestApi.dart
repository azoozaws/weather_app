import 'package:dio/dio.dart';
import 'package:weather_app/models/ModelOfListOfWeather.dart';

class RequestApi {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'f9fb16f2e01449eba31105743231312';
  RequestApi(this.dio);

  Future<ModelOfListOfWeather> getWeather({required String city}) async {
    try {
      final response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
      print(response);
      Map<String, dynamic> data = response.data;
      ModelOfListOfWeather info = ModelOfListOfWeather.fromJson(data);
      print("aaa$info");
      return info;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error, try later');
    }
  }
}
