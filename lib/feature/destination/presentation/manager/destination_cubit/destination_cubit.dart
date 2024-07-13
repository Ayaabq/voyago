// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:voyago/feature/auth/login/data/repo/login_repo.dart';
// import 'package:voyago/feature/auth/login/manger/login_cubit/login_state.dart';

// import '../../../../../destination/utils/storge_token.dart';
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

import '../../../../destination/data/repo/core_repo.dart';
import 'destination_state.dart';


class DestinationCubit extends Cubit<DestinationState> {
  final DestinationRepo coreRepo;

  DestinationCubit( this.coreRepo) : super(DestinationInitial());

  Future<void> fetchDestinationInitial(String url) async {
    emit(DestinationLoading());

    var result = await coreRepo.getDestination(url);
    print(result);
    result.fold(
          (failure)
          {
            emit(TrendingDestinationFailure(failure.errMessage));
            emit(DestinationInitial());
            },
          (success) async {

        emit(DestinationSuccess(success.destinationModels));

      },
    );
  }


}
