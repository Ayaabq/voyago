

import 'package:bloc/bloc.dart';
import 'package:voyago/feature/notification/data/repo/notification_repo.dart';

import '../../../../destination/data/repo/destination_repo.dart';
import 'notification_state.dart';


class NotificationCubit extends Cubit<FavoriteState> {
  final NotificationRepo notificationRepo;

  NotificationCubit( this.notificationRepo) : super(FavoriteInitial());

  Future<void> fetchNotification() async {
    emit(FavoriteLoading());

    var result = await notificationRepo.getNotification();
    result.fold(
          (failure)
          {
            emit(FavoriteFailure(failure.errMessage));
            // emit(DestinationInitial());
            },
          (success) async {

        emit(FavoriteSuccess(success.notificationsModels));

      },
    );
  }


}
