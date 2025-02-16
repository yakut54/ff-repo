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

Future<void> getArticles(List<ArticlesRecord> articlesList) async {
  // Проверяем, что список не пуст
  if (articlesList.isEmpty) {
    debugPrint('[getArticles] Внимание: Получен пустой список статей.');
    return;
  }

  // Преобразуем список ArticlesRecord в список ArticlesStateTypeStruct
  final List<ArticlesStateTypeStruct> articlesStateList =
      articlesList.map((article) {
    // Преобразуем rubricsRef (DocReference) в строку rubricDoc
    final String rubricDoc = _extractIdFromReference(article.rubricsRef);

    // Преобразуем likes (List<DocReference>) в список ID пользователей
    final List<String> likesUserIds = _extractIdsFromList(article.likes);

    // Преобразуем views (List<DocReference>) в список ID пользователей
    final List<String> viewsUserIds = _extractIdsFromList(article.views);

    return ArticlesStateTypeStruct(
      id: article.reference.id,
      name: article.name,
      type: article.type,
      likes: likesUserIds,
      views: viewsUserIds,
      title: article.title,
      rubricDoc: rubricDoc,
      advice: article.advice,
      endTime: article.endTime,
      comments: article.comments,
      isDeleted: article.isDeleted,
      isVisible: article.isVisible,
      startTime: article.startTime,
      additional: article.additional,
      description: article.description,
      isPublished: article.isPublished,
      createdTime: article.createdTime,
      modifiedTime: article.modifiedTime,
      publishedTime: article.publishedTime,
      articleBlocks: article.articleBlocks,
      horoscopeBlocks: article.horoscopeBlocks,
      ffPushNotificationsQueueRef: article.ffPushNotificationsQueueRef,
    );
  }).toList();

  // Сортируем статьи по published_time в порядке убывания (новые сверху)
  articlesStateList.sort(_sortToPublishTime);

  // Обновляем состояние приложения
  FFAppState().update(() {
    FFAppState().ArticlesState = articlesStateList;
  });

  // Логируем результат
  debugPrint(
    '[getArticles] Успешно обновлено состояние статей. '
    'Количество элементов: ${articlesStateList.length}.',
  );
}

/// Сортировка статей по published_time (новые сверху)
int _sortToPublishTime(ArticlesStateTypeStruct a, ArticlesStateTypeStruct b) {
  if (a.publishedTime != null && b.publishedTime != null) {
    return b.publishedTime!.compareTo(a.publishedTime!);
  } else if (a.publishedTime != null) {
    return -1;
  } else if (b.publishedTime != null) {
    return 1;
  } else {
    return 0;
  }
}

/// Извлекает ID из DocumentReference или строки
String _extractIdFromReference(dynamic reference) {
  if (reference is DocumentReference) {
    return reference.id;
  } else if (reference is String) {
    return reference.split('/').last;
  } else {
    return '';
  }
}

/// Преобразует список DocumentReference или строк в список ID
List<String> _extractIdsFromList(List<dynamic>? items) {
  if (items == null) return [];

  return items.map((item) {
    if (item is DocumentReference) {
      return item.id;
    } else if (item is String) {
      return item.split('/').last;
    } else {
      return '';
    }
  }).toList();
}
