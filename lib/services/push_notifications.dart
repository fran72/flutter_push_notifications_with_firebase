import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_16/firebase_options.dart';

class PushNotifications {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;
  static RemoteMessage? initialMessage;
  static final StreamController<String> _messageStreamControllet =
      StreamController.broadcast();

  @pragma('vm:entry-point')
  static Future _backgroundHandler(RemoteMessage message) async {
    debugPrint('on background handles');
  }

  @pragma('vm:entry-point')
  static Future _onMessageHandler(RemoteMessage message) async {
    debugPrint('_onMessageHandler');
  }

  @pragma('vm:entry-point')
  static Future _onMessageOpenApp(RemoteMessage message) async {
    debugPrint('_onMessageOpenApp');
  }

  @pragma('vm:entry-point')
  static Future initializeApp() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    token = await FirebaseMessaging.instance.getToken();

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static closeStreams() {
    _messageStreamControllet.close();
  }
}
