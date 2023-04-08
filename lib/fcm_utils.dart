import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FCMUtils {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true
    );
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      messageHandler(message);
    }
    FirebaseMessaging.onMessage.listen(messageHandler);
    FirebaseMessaging.onBackgroundMessage(messageHandler);
    getToken();
    listenToTopic();
  }

  Future<void> messageHandler(RemoteMessage message) async {
    log(message.notification?.title ?? 'Null title');
    log(message.notification?.body ?? 'Null body');
  }

  Future<void> getToken() async {
    final String? token = await _firebaseMessaging.getToken();
    log(token ?? '');
  }

  Future<void> listenToTopic() async {
    await _firebaseMessaging.subscribeToTopic('rafat');
    // await _firebaseMessaging.unsubscribeFromTopic('rafat');
  }
}