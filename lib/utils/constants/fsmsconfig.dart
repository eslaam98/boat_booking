import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings notificationsSetting =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fsmsconfig() {
  if (kDebugMode) {
    print("hai =======================================================");
  }
  FirebaseMessaging.onMessage.listen((message) {
    if (kDebugMode) {
      print("================== Notification =================");
    }
    if (kDebugMode) {
      print(message.notification!.title);
    }
    if (kDebugMode) {
      print(message.notification!.body);
    }
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  if (kDebugMode) {
    print("============================= page id ");
  }
  if (kDebugMode) {
    print(data['pageid']);
  }
  if (kDebugMode) {
    print("============================= page name ");
  }
  if (kDebugMode) {
    print(data['pagename']);
  }
  if (kDebugMode) {
    print("================== Current Route");
  }
  if (kDebugMode) {
    print(Get.currentRoute);
  }

  if (Get.currentRoute == "/splashScreen" &&
      data['pagename'] == "refreshorderpending") {}
}
