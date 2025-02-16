// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<void> createPushNotifications() async {
  // Получаем ссылку на коллекцию
  final CollectionReference<Map<String, dynamic>> collectionRef =
      FirebaseFirestore.instance.collection('ff_push_notifications_queue');

  // Получаем текущую дату
  final DateTime now = DateTime.now();

  final int currentMonth = now.month;
  final int nextMonth = (currentMonth % 12) + 1;
  final int currentYear = now.year;
  final int nextYear = (nextMonth == 1) ? currentYear + 1 : currentYear;

  Future<void> fetchNotificationsByTitleAndMonth(
      String title, int month, int year) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await collectionRef
          .where('notification_title', isEqualTo: title)
          .where('is_deleted', isEqualTo: false)
          .where('status', isEqualTo: NotificationStatus.inQueue.serialize())
          .get();

      // фильтруем документы по дате отправления ( за каким то хуем String 🤯 )
      final List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDocs =
          snapshot.docs.where((doc) {
        return getDispatchTimeFromDoc(doc).isAfter(
            DateTime(year, month, 1).subtract(const Duration(seconds: 1)));
      }).toList();

      // Получаем дни, для которых уже есть уведомления
      final List<int> existingDays = filteredDocs.map((doc) {
        return getDispatchTimeFromDoc(doc).day;
      }).toList();

      final List<int> allDays = getAllDaysInMonth(year, month);
      final List<int> missingDays =
          allDays.where((day) => !existingDays.contains(day)).toList();

      existingDays.sort();
      print('existingDays ================>> $existingDays');
      print(
          'Missing days for $title in ${getMonthName(month)} $year: $missingDays');

      if (missingDays.isNotEmpty) {
        for (final day in missingDays) {
          await createNotificationRecordForDay(title, year, month, day);
        }
      } else {
        print(
            'All notifications for $title in ${getMonthName(month)} $year are present.');
      }
    } catch (e) {
      print('Error fetching notifications: $e');
    }
  }

  // await fetchNotificationsByTitleAndMonth('Карта дня', nextMonth, nextYear);
  // await fetchNotificationsByTitleAndMonth('Совет ангелов', nextMonth, nextYear);
  // await fetchNotificationsByTitleAndMonth('ЛАЙФХАК', nextMonth, nextYear);

  // Уведомления на следующий месяц
  await Future.wait(['Карта дня', 'Совет ангелов', 'ЛАЙФХАК'].map((title) =>
      fetchNotificationsByTitleAndMonth(title, nextMonth, nextYear)));
}

// Функция для создания уведомления для конкретного дня
Future<void> createNotificationRecordForDay(
    String title, int year, int month, int day) async {
  try {
    final int dispatchHour = getDispatchHourForTitle(title);
    final DateTime dispatchDate = DateTime(year, month, day, dispatchHour);
    final String dispatchTimeString =
        DateFormat('dd.MM.yy HH:mm').format(dispatchDate);
    final String notificationText =
        'На сегодня, ${DateFormat('d MMMM', 'ru_RU').format(dispatchDate)}';

    DocumentReference<Object?> newNotificationRef =
        FfPushNotificationsQueueRecord.collection.doc();

    await newNotificationRef.set({
      ...createFfPushNotificationsQueueRecordData(
        notificationTitle: title,
        notificationText: notificationText,
        status: NotificationStatus.inQueue,
        isDeleted: false,
        dispatchTime: dispatchTimeString,
      ),
      ...mapToFirestore(
        {
          'created_time': FieldValue.serverTimestamp(),
        },
      ),
    });

    print('Notification record created $title for $dispatchTimeString');
  } catch (e) {
    print('Error creating notification record for day $day: $e');
  }
}

// Функция для получения времени отправки из документа Firestore.
DateTime getDispatchTimeFromDoc(
    QueryDocumentSnapshot<Map<String, dynamic>> doc) {
  final dispatchTimeString = doc['dispatch_time'] as String;
  return DateFormat('dd.MM.yy HH:mm').parse(dispatchTimeString);
}

// Функция для определения времени dispatchTime в зависимости от типа уведомления
int getDispatchHourForTitle(String title) {
  switch (title) {
    case 'Карта дня':
      return 4; // 4:00
    case 'Совет ангелов':
      return 2; // 2:00
    case 'ЛАЙФХАК':
      return 0; // 0:00
    default:
      return 0; // По умолчанию
  }
}

// Функция для получения количества дней в месяце
int getDaysInMonth(int year, int month) {
  return DateTime(year, month + 1, 0).day;
}

// Функция для получения названия месяца
String getMonthName(int month, {int year = 2025}) {
  if (month < 1 || month > 12) {
    return 'Некорректный месяц';
  }
  return DateFormat('MMMM', 'ru_RU').format(DateTime(year, month));
}

// Функция для получения списка всех дней месяца
List<int> getAllDaysInMonth(int year, int month) {
  final int daysInMonth = getDaysInMonth(year, month);
  return List<int>.generate(daysInMonth, (index) => index + 1);
}

void handleNotEmptyNotifications() => print('isNotEmpty');
