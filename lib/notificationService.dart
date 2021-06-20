// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService extends StatefulWidget {
//   @override
//   _NotificationServiceState createState() => _NotificationServiceState();
// }
//
// class _NotificationServiceState extends State<NotificationService> {
//   FlutterLocalNotificationsPlugin fltrNotification =
//       FlutterLocalNotificationsPlugin();
//
//   @override
//   void initState() {
//     super.initState();
//     var androidInitilize = new AndroidInitializationSettings('app_icon');
//     var iOSinitilize = new IOSInitializationSettings();
//     var initilizationsSettings = new InitializationSettings(
//         android: androidInitilize, iOS: iOSinitilize);
//     fltrNotification = new FlutterLocalNotificationsPlugin();
//     fltrNotification.initialize(initilizationsSettings,
//         onSelectNotification: notificationSelected);
//   }
//
//   Future notificationSelected(String payload) async {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Text("Notification : $payload"),
//       ),
//     );
//   }
//
//   Future _showNotification() async {
//     var androidDetails = new AndroidNotificationDetails(
//         "Channel ID", "Desi programmer", "This is my channel",
//         importance: Importance.max);
//     var iSODetails = new IOSNotificationDetails();
//     var generalNotificationDetails =
//         new NotificationDetails(android: androidDetails, iOS: iSODetails);
//
//     await fltrNotification.show(
//         0, "Task", "You created a Task", generalNotificationDetails,
//         payload: "Task");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           child: Text("Press Here"),
//           onPressed: () {
//             _showNotification();
//           },
//         ),
//       ),
//     );
//   }
// }
