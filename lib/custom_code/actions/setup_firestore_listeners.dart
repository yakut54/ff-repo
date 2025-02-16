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

/// Инициализация слушателя для коллекции "articles"
Future<void> setupFirestoreListeners() async {
  print("setupFirestoreListeners: Начало работы слушателя");

  final Stream<QuerySnapshot<Map<String, dynamic>>> articleDb =
      FirebaseFirestore.instance
          .collection("articles")
          .where("is_deleted", isEqualTo: false)
          .where("is_visible", isEqualTo: true)
          .where("is_published", isEqualTo: true)
          .orderBy("published_time", descending: true)
          .snapshots();

  try {
    articleDb.listen(
      (querySnapshot) {
        // Получаем текущий список статей из состояния приложения
        final List<ArticlesStateTypeStruct> currentArticles =
            FFAppState().ArticlesState.toList();

        for (final DocumentChange<Map<String, dynamic>> change
            in querySnapshot.docChanges) {
          final DocumentSnapshot<Map<String, dynamic>> doc = change.doc;

          try {
            final ArticlesRecord article = ArticlesRecord.fromSnapshot(doc);

            // Преобразуем rubricsRef в строку
            final String rubricDoc =
                _extractIdFromReference(article.rubricsRef);

            // Преобразуем likes и views в списки ID
            final List<String> likesUserIds =
                _extractIdsFromList(article.likes);
            final List<String> viewsUserIds =
                _extractIdsFromList(article.views);

            // Создаем структуру ArticlesStateTypeStruct
            ArticlesStateTypeStruct articleState = ArticlesStateTypeStruct(
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

            // Обновляем или добавляем статью в зависимости от типа изменения
            switch (change.type) {
              case DocumentChangeType.added:
                // Проверяем, существует ли статья уже в списке
                final int existingIndex =
                    currentArticles.indexWhere((a) => a.id == articleState.id);

                if (existingIndex != -1) {
                  // Если статья уже существует, обновляем её
                  currentArticles[existingIndex] = articleState;
                } else {
                  currentArticles.add(articleState);
                }
                print('added');
                break;
              case DocumentChangeType.modified:
                // Находим индекс изменённой статьи
                final existingIndex =
                    currentArticles.indexWhere((a) => a.id == articleState.id);

                if (existingIndex != -1) {
                  currentArticles[existingIndex] = articleState;
                } else {
                  currentArticles.add(articleState);
                }
                print('modified');
                break;
              case DocumentChangeType.removed:
                // Удаляем статью из списка
                currentArticles.removeWhere((a) => a.id == articleState.id);
                print('removed');
                break;
            }
          } catch (e) {
            print("Ошибка при обработке документа ${doc.id}: $e");
          }
        }

        // Сортируем статьи по published_time в порядке убывания (новые сверху)
        currentArticles.sort(sortArticle);

        // Обновляем состояние приложения
        FFAppState().update(() {
          FFAppState().ArticlesState = currentArticles;
        });

        debugPrint(
          '[setupFirestoreListeners] Успешно обновлено состояние статей. '
          'Количество элементов: ${currentArticles.length}.',
        );
      },
      onError: (error) {
        print("Ошибка при прослушивании Firestore: $error");
        // Попытка повторного подключения через 5 секунд
        Future.delayed(
            const Duration(seconds: 5), () => setupFirestoreListeners());
      },
    );
  } catch (e) {
    print("Произошла ошибка: $e");
    // Попытка повторного подключения через 5 секунд
    Future.delayed(const Duration(seconds: 5), () => setupFirestoreListeners());
  }
}

int sortArticle(ArticlesStateTypeStruct a, ArticlesStateTypeStruct b) {
  // Проверяем, что publishedTime не равно null для обеих статей
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
