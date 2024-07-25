class WeatherModel{
  final double temp;
  final String address;
  final String description;

  WeatherModel({required this.temp, required this.address, required this.description});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        temp: json['currentConditions']['temp'],
        address: json['timezone'],
        description: json['description']

      );
  }
   double get celsiusTemp {
     return double.parse(((temp - 32) * 5 / 9).toStringAsFixed(1));

   }
}