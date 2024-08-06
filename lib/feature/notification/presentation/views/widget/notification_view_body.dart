import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voyago/core/widgets/custom_failure_error.dart';
import 'package:voyago/core/widgets/shimmer/load_List.dart';
import 'package:voyago/feature/notification/presentation/manager/notification_cubit/notification_state.dart';
import 'package:voyago/feature/notification/presentation/manager/notification_cubit/notificatoin_cubit.dart';

import '../../../../../core/helper/date_time_helper.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NotificationCubit>().fetchNotification();
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context,state){
          if(state is NotificationSuccess){
            final notifications =state.notificationsModels;
            return ListView.separated(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  trailing: Text(
                      DateTimeHelper.formatDateMMMDY(notification.time)),
                  leading: const CircleAvatar(
                    child: Icon(Icons.wallet),
                  ),
                  title: Text(notification.title),
                  subtitle: Text(notification.body),
                  onTap: () {
                    // Handle notification tap
                  },
                );
              }, separatorBuilder: (BuildContext context, int index) =>const Divider(),
            );
          }else if( state is NotificationFailure){
            return CustomFailureError(errMessage: state.errorMessage);
          }else{
            return LoadList();
          }
        });
  }
}
