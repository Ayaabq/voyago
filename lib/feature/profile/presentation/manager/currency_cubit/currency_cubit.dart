import 'package:bloc/bloc.dart';
import 'package:voyago/feature/profile/data/repo/settings_repo.dart';
import 'package:voyago/feature/profile/presentation/manager/currency_cubit/currency_state.dart';

import '../../../data/models/currency_model.dart';



class CurrencyCubit extends Cubit<CurrencyState> {
  final CurrencyRepo placeRepo;

  double exchanger=1;
  CurrencyModel? currencyModel;
  CurrencyCubit(this.placeRepo) : super(CurrencyInitial());

  Future<void> fetchCurrency() async {

    emit(CurrencyLoading());
    final result = await placeRepo.currency;
    result.fold(
          (failure) {
        emit(CurrencyFailure(failure.errMessage));
      },
          (success) {
            currencyModel=success.currencyModel;
        emit(CurrencySuccess(success.currencyModel));
      },
    );
  }

  Future<void> toSYP() async{
    if(currencyModel!=null){
      exchanger=currencyModel!.syp;
    }
    else{
     await fetchCurrency();
      if(state is CurrencySuccess){
        exchanger=currencyModel!.syp;
      }else{
        emit(CurrencyFailure("can't get currency"));
      }
    }

  }
  Future<void> toEUR() async{
    if(currencyModel!=null){
      exchanger=currencyModel!.syp;
    }
    else{
     await fetchCurrency();
      if(state is CurrencySuccess){
        exchanger=currencyModel!.eur;
      }else{
        emit(CurrencyFailure("can't get currency"));
      }
    }

  }





}