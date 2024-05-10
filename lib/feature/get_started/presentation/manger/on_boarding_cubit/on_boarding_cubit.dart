import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voyago/feature/get_started/data/models/on_boarding_model.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
}
