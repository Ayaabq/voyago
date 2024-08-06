
import 'package:dartz/dartz.dart';
import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/notification/presentation/manager/notification_cubit/notification_state.dart';




abstract class NotificationRepo {
  Future<Either<Failure, NotificationSuccess>>
  getNotification();
}
