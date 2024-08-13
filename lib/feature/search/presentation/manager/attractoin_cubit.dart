// // import 'package:bloc/bloc.dart';
// // import 'package:freezed_annotation/freezed_annotation.dart';
// // import 'package:voyago/feature/auth/login/data/weather_repo/login_repo.dart';
// // import 'package:voyago/feature/auth/login/manger/login_cubit/login_state.dart';
//
// // import '../../../../../destination/utils/storge_token.dart';
// // import '../../data/model/login_model.dart';
//
// // class LoginCubit extends Cubit<LoginState> {
// //   final LoginRepo authRepository;
// //   final TokenStorage tokenStorage;
//
// //   LoginCubit(this.authRepository, this.tokenStorage) : super(LoginInitial());
//
// //   Future<void> login(LoginModel loginModel) async {
// //     emit(LoginLoading());
//
// //     final result = await authRepository.login(loginModel);
//
// //     result.fold(
// //       (failure) => emit(LoginFailure(failure.toString())),
// //       (tokens) => emit(LoginSuccess(
// //         accessToken: tokens.toString(),
// //         refreshToken: tokens.toString(),
// //       )),
// //     );
// //   }
// // }
//
// import 'package:bloc/bloc.dart';
// import 'package:voyago/feature/attraction/data/repo/attraction_repo.dart';
// import 'package:voyago/feature/attraction/presentation/manager/attraction_state.dart';
//
//
//
// class AttractionCubit extends Cubit<AttractionState> {
//   final AttractionRepo attractionRepo;
//
//   AttractionCubit( this.attractionRepo) : super(AttractionInitial());
//
//   Future<void> fetchAttractionInitial(String url) async {
//
//     emit(AttractionLoading());
//
//     var result = await attractionRepo.getAttraction(url);
//     result.fold(
//           (failure)
//       {
//
//         emit( AttractionFailure(failure.errMessage));
//         // emit(AttractionInitial());
//       },
//           (success) async {
//         emit(AttractionSuccess(success.attractionModel));
//
//       },
//     );
//   }
//
//
// }
