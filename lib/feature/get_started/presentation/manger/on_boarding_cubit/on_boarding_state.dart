part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingForward extends OnBoardingState {
  final OnBoardingModel onBoardingModel ;

  OnBoardingForward({required this.onBoardingModel});
}
