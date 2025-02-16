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

Future<void> toggleLike(ArticlesStateTypeStruct article,
    DocumentReference currentUserReference) async {
  try {
    // Получаем ссылку на документ статьи
    final articleRef =
        FirebaseFirestore.instance.collection('articles').doc(article.id);

    print('articleRef 1111111111111111111111111  $articleRef');

    // Получаем текущий список лайков
    final articleSnapshot = await articleRef.get();

    print('articleSnapshot 2222222222222222222222222222 $articleSnapshot');

    final likes = articleSnapshot.data()?['likes'] ?? [];

    print('likes 3333333333333333333333333333 $likes');

    // Проверяем, поставил ли пользователь лайк
    if (likes.contains(currentUserReference)) {
      await articleRef.update({
        'likes': FieldValue.arrayRemove([currentUserReference]),
      });
      print('Лайк удален: ${article.id}');
    } else {
      await articleRef.update({
        'likes': FieldValue.arrayUnion([currentUserReference]),
      });
      print('Лайк добавлен: ${article.id}');
    }
  } catch (e) {
    print('Ошибка при обновлении лайка: $e');
  }
}
