import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notifications/firebase_options.dart';
import 'package:push_notifications/services/push_notifications_service.dart';
import 'package:push_notifications/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  PushNotificationsService.init();
  runApp(const PushNotifications());
}

class PushNotifications extends StatelessWidget {
  const PushNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomeView(),
    );
  }
}
