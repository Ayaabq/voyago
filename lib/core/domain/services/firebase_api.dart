import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseApi{
  //create an instance of firebase messaging
  final _firebaseMessaging=FirebaseMessaging.instance;

  //function to initialize notification
  Future<void> initNotifications()async{
    //request permission from the user
    final fcmToken=await _firebaseMessaging.getToken();
    print("Token:$fcmToken");
    //fetch the FCM token for this device
    initPushNotifications();
  }
  void handleMessage(RemoteMessage? message){
    if(message == null) return;
    // navigate to the notification screen

  }

  Future initPushNotifications() async{
    FirebaseMessaging.instance.getInitialMessage().
    then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}