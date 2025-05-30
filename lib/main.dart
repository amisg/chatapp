import 'dart:developer';

import 'package:chatapp/api/apis.dart';
import 'package:chatapp/models/chat_user.dart';
import 'package:chatapp/notification_service.dart';
import 'package:chatapp/screens/auth/login_screen.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/home_sreen.dart';
import 'package:chatapp/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chatapp/firebase_options.dart';

// Global object for accessing device screen size
late Size mq;

// Global navigator key for handling navigation from notification tap
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log('Handling a background message: ${message.messageId}');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    _initializeFirebase();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Attach the navigator key
      title: "Chat App",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 19,
          ),
          backgroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/chat':
            (context) => ChatScreen(
              user: ModalRoute.of(context)!.settings.arguments as ChatUser,
            ),
      },
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize notification service
  await NotificationService.initialize();

  // Handle FCM messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final userId = message.data['userId'] ?? 'unknown';
    final sender = message.notification?.title ?? 'Unknown';
    final body = message.notification?.body ?? 'New message';

    // Show a local notification
    NotificationService.showNotification(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: 'New Message from $sender',
      body: body,
      payload: userId, // Pass the user ID as payload
    );
  });

  // Handle notification tap when app is in background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    final userId = message.data['userId'] ?? 'unknown';
    await navigateToChat(userId);
  });

  // Handle initial message (app opened from terminated state)
  FirebaseMessaging.instance.getInitialMessage().then((
    RemoteMessage? message,
  ) async {
    if (message != null) {
      final userId = message.data['userId'] ?? 'unknown';
      await navigateToChat(userId);
    }
  });
}

Future<void> navigateToChat(String userId) async {
  // Fetch the ChatUser from Firestore using the userId
  final userSnapshot =
      await Apis.firestore.collection('users').doc(userId).get();

  if (userSnapshot.exists) {
    final chatUser = ChatUser.fromJson(userSnapshot.data()!);
    navigatorKey.currentState?.pushNamed(
      '/chat',
      arguments: chatUser, // Pass the ChatUser object
    );
  } else {
    log('User with ID $userId not found');
  }
}
