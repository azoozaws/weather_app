class ModelOfListOfWeather {
  //this modle for form news
  String city;
  String state;
  String imageOfState;
  num degree;
  num maxDegree;
  num minDegree;
  DateTime dateTime;
  ModelOfListOfWeather({
    required this.city,
    required this.state,
    required this.imageOfState,
    required this.degree,
    required this.maxDegree,
    required this.minDegree,
    required this.dateTime,
  });

  factory ModelOfListOfWeather.fromJson(json) {
    final String city;
    final String state;
    final String imageOfState;
    final num degree;
    final num maxDegree;
    final num minDegree;
    final DateTime dateTime;

    city = json["location"]["name"];
    state = json["current"]["condition"]["text"];
    imageOfState = json["current"]["condition"]["icon"];
    degree = json["current"]["temp_c"];
    maxDegree = json["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
    minDegree = json["forecast"]["forecastday"][0]["day"]["mintemp_c"];
    dateTime = DateTime.parse(
      json["current"]["last_updated"],
    );

    return ModelOfListOfWeather(
        city: city,
        state: state,
        imageOfState: imageOfState,
        degree: degree,
        maxDegree: maxDegree,
        minDegree: minDegree,
        dateTime: dateTime);
  }
}
