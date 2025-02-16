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

import '/backend/schema/structs/index.dart'; // Убедитесь, что здесь правильный импорт
import 'index.dart'; // Imports other custom actions
import 'dart:math'; // Импортируем библиотеку для генерации случайных чисел

Future<void> getRandomSplashItem(List<NewSplashsRecord>? data) async {
  // Проверяем, что данные не равны null
  if (data != null && data.isNotEmpty) {
    // Генерируем случайный индекс
    final randomIndex = Random().nextInt(data.length);
    final randomRecord = data[randomIndex]; // Получаем случайный элемент

    // Преобразуем случайный элемент NewSplashsRecord в NewSplashStruct
    NewSplashStruct newSplash = NewSplashStruct(
        title: randomRecord.title,
        text: randomRecord.text,
        link: randomRecord.link,
        image: randomRecord.image,
        btnText: randomRecord.btnText,
        isVisible: randomRecord.isVisible,
        isDeleted: randomRecord.isDeleted,
        createDate: randomRecord.createDate,
        greetingsText: randomRecord.greetingsText,
        firstText: randomRecord.firstText,
        cancelBtnText: randomRecord.cancelBtnText);

    // Обновляем состояние приложения
    FFAppState().update(() {
      FFAppState().NewSplash = newSplash; // Присваиваем случайный элемент
    });
  } else {
    print('No data available to select a random element.');
  }
}
