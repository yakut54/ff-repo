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

Future getSuggesions(List<SuggestionsRecord> suggestionsList) async {
  // Проверяем, что список не пуст
  if (suggestionsList.isEmpty) {
    debugPrint('[getSuggestions] Внимание: Получен пустой список предложений.');
    return;
  }

  // Преобразуем список SuggestionsRecord в список SuggestionStateStruct
  List<SuggestionStateStruct> suggestionStateList =
      suggestionsList.map((suggestion) {
    return SuggestionStateStruct(
      coverImage: suggestion.coverImage,
      createdTime: suggestion.createdTime,
      isDeleted: suggestion.isDeleted,
      isVisible: suggestion.isVisible,
      link: suggestion.link,
      modifiedTime: suggestion.modifiedTime,
      name: suggestion.name,
    );
  }).toList();

  // Обновляем состояние приложения
  FFAppState().update(() {
    FFAppState().SuggestionState = suggestionStateList;
  });

  // Логируем результат
  debugPrint(
    '[getSuggestions] Успешно обновлено состояние предложений. '
    'Количество элементов: ${suggestionStateList.length}.',
  );
}
