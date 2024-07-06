// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:voyago/feature/auth/login/data/repo/login_repo.dart';
// import 'package:voyago/feature/auth/login/manger/login_cubit/login_state.dart';

// import '../../../../../core/utils/storge_token.dart';
// import '../../data/model/login_model.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepo authRepository;
//   final TokenStorage tokenStorage;

//   LoginCubit(this.authRepository, this.tokenStorage) : super(LoginInitial());

//   Future<void> login(LoginModel loginModel) async {
//     emit(LoginLoading());

//     final result = await authRepository.login(loginModel);

//     result.fold(
//       (failure) => emit(LoginFailure(failure.toString())),
//       (tokens) => emit(LoginSuccess(
//         accessToken: tokens.toString(),
//         refreshToken: tokens.toString(),
//       )),
//     );
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/core/utils/storge_token.dart';
import 'package:voyago/feature/auth/login/data/repo/login_repo.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voyago/feature/home/data/repo/destination_repo.dart';
import 'package:voyago/feature/home/presentation/maneger/trending_destination_state.dart';


class TrendingDestinationCubit extends Cubit<TrendingDestinationState> {
  final HomeRepo homeRepo;

  TrendingDestinationCubit( this.homeRepo) : super(TrendingDestinationInitial());

  Future<void> fetchTrendingDestinationInitial() async {
    emit(TrendingDestinationLoading());

    var result = await homeRepo.trendingDestination();
    print(result);
    result.fold(
          (failure) => emit(
              TrendingDestinationFailure(failure.errMessage)

    ),
          (success) async {

        emit(TrendingDestinationSuccess(success.destinationModels));

      },
    );
  }


}
