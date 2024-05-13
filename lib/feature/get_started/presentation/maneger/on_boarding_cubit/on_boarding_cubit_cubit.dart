import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'on_boarding_cubit_state.dart';

class OnBoardingCubitCubit extends Cubit<OnBoardingCubitState> {
  OnBoardingCubitCubit() : super(OnBoardingCubitInitial());
  PageController  pageController =PageController(initialPage: 0);



  void setPage(int index) {
    if(index == 4) {
      emit(OnBoardingLastState());
    }else{
      emit(OnBoardingAnyState());
    }
  }
}
