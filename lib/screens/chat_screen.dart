import 'package:ably_flutter_plugin/ably_flutter_plugin.dart' as ably;
import 'package:flutter/material.dart';
import 'package:flutter_flexible_toast/flutter_flexible_toast.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

ably.Realtime realtimeInstance;
ably.RealtimeChannel chatChannel;

var flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

Future<void> createAblyRealtimeInstance() async {
  var clientOptions =
      ably.ClientOptions.fromKey("GQH43A.hUxHQw:7RRQ9o9AT3DGdLOl");
  try {
    realtimeInstance = ably.Realtime(options: clientOptions);
    print('Ably instantiated');
    chatChannel = realtimeInstance.channels.get('testChannel');
    subscribeToChatChannel();
    realtimeInstance.connection
        .on(ably.ConnectionEvent.connected)
        .listen((ably.ConnectionStateChange stateChange) async {
      print('Realtime connection state changed: ${stateChange.event}');
    });
  } catch (error) {
    print('Error creating Ably Realtime Instance: $error');
    rethrow;
  }
}

void subscribeToChatChannel() {
  var messageStream = chatChannel.subscribe();
  messageStream.listen((ably.Message message) {
    print("New message arrived -- \n \n $message");
    // _showToastMessage(message.data);
    showNotification(message.data);
  });
}

Future<void> _showToastMessage(String message) async {
  await FlutterFlexibleToast.showToast(
      message: message,
      elevation: 100,
      toastLength: Toast.LENGTH_LONG,
      toastGravity: ToastGravity.BOTTOM,
      radius: 100,
      backgroundColor: Colors.black.withOpacity(0.5),
      timeInSeconds: 5);
}


Future onSelectNotification(String payload) {
  debugPrint("payload : $payload");
}

showNotification(String message) async {
  var android2 = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var iOS2 = new IOSInitializationSettings();

  var initSettings = new InitializationSettings(android: android2, iOS: iOS2);
  flutterLocalNotificationsPlugin.initialize(initSettings,
      onSelectNotification: onSelectNotification);


  var android = new AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.high, importance: Importance.max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android: android, iOS: iOS);
  await flutterLocalNotificationsPlugin.show(
      0, 'New Notification', message , platform,
      payload: message);
}
