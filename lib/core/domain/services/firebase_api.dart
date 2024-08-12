import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:voyago/core/utils/app_router.dart';

import '../../utils/storge_token.dart';
class FirebaseApi{
  //create an instance of firebase messaging
  final _firebaseMessaging=FirebaseMessaging.instance;

  //function to initialize notification
  Future<void> initNotifications()async{
    //request permission from the user
    final fcmToken=await _firebaseMessaging.getToken();
    print("Token:$fcmToken");
    //fetch the FCM token for this device
  await AppStorage.instance.writeData(AppStorage.FCM_TOKEN, fcmToken);

    initPushNotifications();
  }
  void handleMessage(RemoteMessage? message){
    if(message == null) return;
    // navigate to the notification screen
    navigatorKey.currentState!.pushReplacementNamed(AppRouter.kNotificationView);

  }

  Future initPushNotifications() async{
    FirebaseMessaging.instance.getInitialMessage().
    then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}