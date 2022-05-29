import 'package:awesome_notifications/awesome_notifications.dart';
import 'utilities.dart';

Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
      '${Emojis.money_money_bag + Emojis.plant_cactus} Buy plant food now!!!',
      body: 'Florist at 123 main st. has 2 in stock',
      bigPicture: 'asset://assets/notification_map.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}

  Future<void> createWaterReminderNotification(
      NotificationWeekAndTime notificationSchedule) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        notificationLayout: NotificationLayout.Default,
        title: '${Emojis.wheater_droplet} Add some water to your plant!!',
        body: "Water your plant regularly to keep it healthy",
      ),
      actionButtons: [
        NotificationActionButton(key: "MARK_DONE", label: 'Mark Done'),
      ],
      schedule: NotificationCalendar(
        weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }
    Future <void> cancelSchedule() async{
      await AwesomeNotifications().cancelAllSchedules();
}
