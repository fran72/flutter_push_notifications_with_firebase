import 'package:flutter/material.dart';
import 'package:flutter_application_16/screens/screens.dart';
import 'package:flutter_application_16/services/push_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotifications.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
