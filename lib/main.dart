import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'plant_state_page.dart';
import 'home_page.dart';

void main() {
  AwesomeNotifications()
      .initialize('resource://drawable/res_notification_app_icon', [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic_Notifications',
      channelDescription: "Hello",
      importance: NotificationImportance.High,
      channelShowBadge: true,
      defaultColor: Colors.teal,
    ),
    NotificationChannel(
      channelKey: 'scheduled_channel',
      channelName: 'Scheduled Notifications',
      channelDescription: "Hey!",
      channelShowBadge: true,
      soundSource: 'resource://raw/res_custom_notification',
      importance: NotificationImportance.High,
      locked: true,
      defaultColor: Colors.teal,
    ),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenThumb',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(),
        '/plant': (context) => PlantStatePage(),
      },
    );
  }
}
