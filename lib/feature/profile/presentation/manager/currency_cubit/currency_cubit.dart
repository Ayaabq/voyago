import 'package:bloc/bloc.dart';
import 'package:voyago/feature/profile/data/repo/settings_repo.dart';
import 'package:voyago/feature/profile/presentation/manager/currency_cubit/currency_state.dart';

import '../../../data/models/currency_model.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepo placeRepo;

  double exchanger = 1;
  String selectedCurrency = "USD";
  CurrencyModel? currencyModel;

  CurrencyCubit(this.placeRepo) : super(CurrencyInitial());

  Future<void> fetchCurrency() async {
    emit(CurrencyLoading(exchanger: exchanger, selectedCurrency: selectedCurrency));
    final result = await placeRepo.currency;
    result.fold(
          (failure) {
        emit(CurrencyFailure(
          errorMessage: failure.errMessage,

        ),);
      },
          (success) {
        currencyModel = success.currencyModel;
        emit(CurrencySuccess(
          currencyModel: success.currencyModel,
          exchanger: exchanger,
          selectedCurrency: selectedCurrency,
        ));
      },
    );
  }

  void toSYP() {
    exchanger = currencyModel!.syp;
    selectedCurrency = "SYP";
    emit(CurrencyChanged(
      exchanger: exchanger,
      selectedCurrency: selectedCurrency,
    ));
  }

  void toEUR() {
    exchanger = currencyModel!.eur;
    selectedCurrency = "EUR";
    emit(CurrencyChanged(
      exchanger: exchanger,
      selectedCurrency: selectedCurrency,
    ));
  }

  void toUSD() {
    exchanger = 1;
    selectedCurrency = "USD";
    emit(CurrencyChanged(
      exchanger: exchanger,
      selectedCurrency: selectedCurrency,
    ));
  }
}
