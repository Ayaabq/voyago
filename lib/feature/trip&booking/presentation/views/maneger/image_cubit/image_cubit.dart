import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'image_cubit_state.dart';

class OnBoardingCubitCubit extends Cubit<ImageCubitState> {
  OnBoardingCubitCubit() : super(ImageCubitInitial());
  int imageIndex = 0;



  void setImage(int index) {
    emit(ImageChangeState());

  }
}
