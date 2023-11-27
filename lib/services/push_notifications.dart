import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_16/firebase_options.dart';

class PushNotifications {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;
  static RemoteMessage? initialMessage;

  @pragma('vm:entry-point')
  static Future initializeApp() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    token = await FirebaseMessaging.instance.getToken();
    debugPrint(token);
    debugPrint('initial...........$initialMessage');
  }
}


// SHA1: 1F:94:33:D7:86:C8:37:65:4B:C0:45:9D:76:3A:8F:A1:B3:BD:0F:F8
// SHA-256: CF:53:7B:A6:26:26:9E:01:5E:2D:BC:2E:18:01:1B:0D:8B:39:C1:7A:AC:2C:5D:EB:37:AD:02:EF:AF:EB:C3:64

// token: fHI9R373QsiAM7pXzXCqJc:APA91bHPcxNFwb7QjQUrwuYVa1gmpIWmbybk4rjAtHtjP83VWhORUZGDs7en0aZ5DnqnzQamWUt6y5Nd1BL8yGu8AVBDQLVRYq1YxJjp8MwNI2a8WBU5o5qn1kcak6gcCj3PhADtmeeD

// gitignore test 2b
