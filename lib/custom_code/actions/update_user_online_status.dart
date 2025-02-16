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

import 'index.dart'; // Imports other custom actions

import '../../auth/firebase_auth/auth_util.dart';

Future updateUserOnlineStatus() async {
  try {
    // Получаем последний документ из коллекции StatsRecord
    final query = await StatsRecord.collection
        .orderBy('created_time', descending: true)
        .limit(1)
        .get();

    // Если документ не найден, завершаем выполнение
    if (query.docs.isEmpty) return;

    // Преобразуем документ в объект StatsRecord
    final StatsRecord statsRecord = StatsRecord.fromSnapshot(query.docs.first);

    // Получаем текущее время
    final now = DateTime.now().copyWith(microsecond: 0, millisecond: 0);

    // Фильтруем записи о взаимодействии текущего пользователя
    final List<UserInteractionStruct> userInteractionList = statsRecord.online
        .where((UserInteractionStruct interaction) =>
            interaction.user == currentUserReference)
        .toList();

    // Удаляем старые записи о взаимодействии текущего пользователя
    if (userInteractionList.isNotEmpty) {
      await statsRecord.reference.update({
        'online': FieldValue.arrayRemove(
          userInteractionList
              .map((interaction) => interaction.toMap())
              .toList(),
        ),
      });
    }

    // Очищаем старые записи (старше 1 часа)
    final cutoffTime = now.subtract(const Duration(hours: 1));
    final oldInteractions = statsRecord.online.where((interaction) {
      return interaction.timestamp != null &&
          interaction.timestamp!.isBefore(cutoffTime);
    }).toList();

    if (oldInteractions.isNotEmpty) {
      await statsRecord.reference.update({
        'online': FieldValue.arrayRemove(
          oldInteractions.map((interaction) => interaction.toMap()).toList(),
        ),
      });
    }

    // Ограничиваем общее количество записей в массиве (например, 100)
    if (statsRecord.online.length > 100) {
      final excessInteractions =
          statsRecord.online.sublist(0, statsRecord.online.length - 100);
      await statsRecord.reference.update({
        'online': FieldValue.arrayRemove(
          excessInteractions.map((interaction) => interaction.toMap()).toList(),
        ),
      });
    }

    // Создаем новую запись о взаимодействии пользователя
    final UserInteractionStruct newUserInteraction = UserInteractionStruct(
      timestamp: now,
      user: currentUserReference,
      role: currentUserDocument?.role,
    );

    // Добавляем новую запись о взаимодействии пользователя
    await statsRecord.reference.update({
      'online': FieldValue.arrayUnion([newUserInteraction.toMap()]),
    });

    // Подсчитываем уникальных пользователей онлайн
    final uniqueUsers = statsRecord.online
        .map(
            (interaction) => interaction.user?.id) // Извлекаем ID пользователей
        .toSet() // Удаляем дубликаты
        .length; // Подсчитываем количество уникальных ID

    print('Уникальных пользователей онлайн: $uniqueUsers');
    print('Статус пользователя обновлён');
  } catch (e) {
    print('Error in updateUserOnlineStatus: $e');
  }
}
