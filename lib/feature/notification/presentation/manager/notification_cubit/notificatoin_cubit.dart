

import 'package:bloc/bloc.dart';
import 'package:voyago/feature/notification/data/repo/notification_repo.dart';

import '../../../../destination/data/repo/destination_repo.dart';
import 'notification_state.dart';


class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo notificationRepo;

  NotificationCubit( this.notificationRepo) : super(NotificationInitial());

  Future<void> fetchNotification() async {
    emit(NotificationLoading());

    var result = await notificationRepo.getNotification();
    result.fold(
          (failure)
          {
            emit(NotificationFailure(failure.errMessage));
            // emit(DestinationInitial());
            },
          (success) async {

        emit(NotificationSuccess(success.notificationsModels));

      },
    );
  }


}
