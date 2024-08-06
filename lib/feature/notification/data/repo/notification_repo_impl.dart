
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:voyago/core/errors/failure.dart';
import 'package:voyago/feature/notification/data/repo/notification_repo.dart';
import 'package:voyago/feature/notification/presentation/manager/notification_cubit/notification_state.dart';

import '../../../../core/domain/services/api.dart';
import '../../../../core/utils/confg.dart';


class NotificationRepoImp implements NotificationRepo {
  final ApiServices api;

  NotificationRepoImp(this.api);


  @override
  Future<Either<Failure, NotificationSuccess>> getNotification() async{
    try {
      var response = await api.get(Confg.getNotificatio, hasToken: true);
      return right(NotificationSuccess.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServiecesFailure.fromDioError(e));
      }
      return left(ServiecesFailure(e.toString()));
    }
  }


}
