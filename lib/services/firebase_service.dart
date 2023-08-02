import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> onHandleBackgroundMessage(RemoteMessage message) async{
  print('Title : ${message.notification?.title}'); 
  print('Body : ${message.notification?.body}'); 
  print('Payload : ${message.data}'); 
}


class FirebaseService{
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initPushNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print('token: $token');
    FirebaseMessaging.onBackgroundMessage(onHandleBackgroundMessage);
  }
}