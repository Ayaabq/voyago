import 'package:voyago/feature/profile/data/models/currency_model.dart';

abstract class CurrencyState {
  final double exchanger;
  final String selectedCurrency;

  CurrencyState({
    this.exchanger = 1.0,
    this.selectedCurrency = "USD",
  });
}

class CurrencyInitial extends CurrencyState {
  CurrencyInitial({
    super.exchanger,
    super.selectedCurrency,
  });
}

class CurrencyLoading extends CurrencyState {
  CurrencyLoading({
    super.exchanger,
    super.selectedCurrency,
  });
}

class CurrencySuccess extends CurrencyState {
  final CurrencyModel currencyModel;

  CurrencySuccess({
    required this.currencyModel,
    super.exchanger,
    super.selectedCurrency,
  });

  static CurrencySuccess fromJson(Map<String, dynamic> response) {
    final currencyModel = CurrencyModel.fromJson(response["conversion_rates"]);

    return CurrencySuccess(
      currencyModel: currencyModel,
    );
  }
}

class CurrencyChanged extends CurrencyState {
  CurrencyChanged({required super.exchanger, required super.selectedCurrency});
}

class CurrencyFailure extends CurrencyState {
  final String errorMessage;

  CurrencyFailure({
    required this.errorMessage,
    super.exchanger,
    super.selectedCurrency,
  });

  static CurrencyFailure fromJson(Map<String, dynamic> response) {
    return CurrencyFailure(
      errorMessage: response['err'] ?? 'Unknown error',
      exchanger: 1.0,
      selectedCurrency: "USD",
    );
  }
}
