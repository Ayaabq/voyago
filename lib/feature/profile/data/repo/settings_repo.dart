
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/profile/presentation/manager/currency_cubit/currency_state.dart';


abstract class CurrencyRepo {
  Future<Either<Failure, CurrencySuccess>>
  get currency;

}
