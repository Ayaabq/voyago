import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_cubit_state.dart';

class OnBoardingCubitCubit extends Cubit<OnBoardingCubitState> {
  OnBoardingCubitCubit() : super(OnBoardingCubitInitial());
  int index=0;

  void changePage({required index}){
    this.index=index;
    emit(OnBoardingChangeState());

  }
}
