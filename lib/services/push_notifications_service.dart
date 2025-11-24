import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    print('Token: $token');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
  static Future<void> handleBackgroundMessage (RemoteMessage message) async{}
}
