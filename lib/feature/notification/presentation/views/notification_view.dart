import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/helper/date_time_helper.dart';
import 'package:voyago/core/utils/services_locater.dart';
import 'package:voyago/feature/notification/data/repo/notification_repo_impl.dart';
import 'package:voyago/feature/notification/presentation/manager/notification_cubit/notificatoin_cubit.dart';
import 'package:voyago/feature/notification/presentation/views/widget/notification_view_body.dart';

import '../../data/model/notification_model.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationModel> notifications =  [
      NotificationModel(
        title: 'New Message',
        body: 'You have received a new message from John.',
        id: 1, time: DateTime.now(),
      ),
      NotificationModel(
        title: 'Update Available',
        body: 'A new update is available for your app.',
        id: 1, time: DateTime.now(),

      ),
      NotificationModel(
        title: 'Reminder',
        body: 'Don\'t forget your meeting at 3 PM today.',
        id: 1, time: DateTime.now(),
      ),
      NotificationModel(
        title: 'Friend Request',
        body: 'Alice has sent you a friend request.',
        id: 1, time: DateTime.now(),
      ),
    ];

    return BlocProvider(
      create: (context)=>NotificationCubit(getIt.get<NotificationRepoImp>()),
      child:  Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const NotificationViewBody(),
    ),);
  }
}



