import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:green_thumbs/app_bar_title.dart';
import 'package:green_thumbs/notifications.dart';
import 'package:green_thumbs/plant_image.dart';
import 'package:green_thumbs/utilities.dart';
import 'home_page_button.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Allow Notifications"),
            content: const Text("Our App would like to send you notifications"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Don't Allow",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then(
                        (_) => Navigator.pop(context),
                      );
                },
                child: const Text(
                  "Allow",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Notification created on channel ${notification.channelKey}"),
        ),
      );
    Navigator.pushNamed(context, '/plant');
    });
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/plant');
            },
            icon: const Icon(
              Icons.insert_chart_outlined_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PlantImage(),
            const SizedBox(
              height: 25,
            ),
            HomePageButtons(
                onPressedOne: createPlantFoodNotification,
                onPressedTwo: () async {
                   NotificationWeekAndTime? pickedSchedule = await pickSchedule(context);
                   if (pickedSchedule != null) {
                     createWaterReminderNotification(pickedSchedule);
                   }
                },
                onPressedThree: cancelSchedule,
            ),
          ],
        ),
      ),
    );
  }
}
