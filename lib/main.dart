// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_16/screens/screens.dart';
import 'package:flutter_application_16/services/push_notifications.dart';

@pragma('vm:entry-point')
Future _backgroundHandler(RemoteMessage message) async {
  debugPrint('on background handles');
}

@pragma('vm:entry-point')
Future _onMessageHandler(RemoteMessage message) async {
  debugPrint('_onMessageHandler');
}

@pragma('vm:entry-point')
Future _onMessageOpenApp(RemoteMessage message) async {
  debugPrint('_onMessageOpenApp');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotifications.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  FirebaseMessaging.onMessage.listen(_onMessageHandler);
  FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => const HomeScreen(),
          'message': (BuildContext context) => const HomeScreen(),
        });
  }
}
