
import 'package:voyago/feature/home/data/models/weather_model.dart';
import 'package:voyago/feature/profile/data/models/currency_model.dart';



abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencySuccess extends CurrencyState {
  final CurrencyModel currencyModel;

  CurrencySuccess(this.currencyModel);

  static CurrencySuccess fromJson(Map<String, dynamic> response) {
    final placeModel = CurrencyModel.fromJson(response["conversion_rates"]);
    return CurrencySuccess(placeModel);
  }
}


class CurrencyFailure extends CurrencyState {
  final String errorMessage;
  CurrencyFailure(this.errorMessage);

  static CurrencyFailure fromJson(Map<String, dynamic> response) {
    return CurrencyFailure(response['err'] ?? 'Unknown error');
  }



}