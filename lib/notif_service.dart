import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

  Future<void> backgrounNoti(RemoteMessage message) async{
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
  }

class NotificationService {

  final messaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await messaging.requestPermission();
    final token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');
    FirebaseMessaging.onBackgroundMessage(backgrounNoti);
  }


  
}