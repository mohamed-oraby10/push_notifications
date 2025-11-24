import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notifications/services/local_notifications_service.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    print('Token: $token');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    handleForegroundMessage();
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showBasicNotification(message);
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {}
}
