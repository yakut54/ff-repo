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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> removeNullReferencesFromViews() async {
  // Получаем ссылку на коллекцию
  final CollectionReference<Map<String, dynamic>> collectionRef =
      FirebaseFirestore.instance.collection('ff_push_notifications_queue');

  // Запрашиваем все записи
  final QuerySnapshot<Map<String, dynamic>> snapshot =
      await collectionRef.get();

  // Проходим по всем документам
  for (final QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
    final data = doc.data();

    // Проверяем, существует ли поле views и является ли оно массивом
    if (data.containsKey('views') && data['views'] is List) {
      final List<dynamic> views = data['views'];

      // Фильтруем массив, удаляя null
      final List<dynamic> filteredViews =
          views.where((view) => view != null).toList();

      // Если массив изменился, обновляем документ
      if (filteredViews.length != views.length) {
        print('Обновляем документ с ID: ${doc.id}');
        await doc.reference.update({'views': filteredViews});
      }
    }
  }

  print('Обновление завершено!');
}
