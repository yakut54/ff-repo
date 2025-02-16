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

Future<void> getRubrics(List<RubricsRecord> rubricsList) async {
  // Проверяем, что список не пуст
  if (rubricsList.isEmpty) {
    debugPrint('[getRubrics] Внимание: Получен пустой список рубрик.');
    return;
  }

  // Преобразуем список RubricsRecord в список RubricsStateTypeStruct
  List<RubricsStateTypeStruct> rubricsStateList = rubricsList.map((rubric) {
    // Получаем id рубрики
    String rubricId = rubric.reference.id;

    // Преобразуем articlesRefs (List<DocReference>) в список строк articlesDocs
    List<String> articlesDocs = rubric.articlesRefs
        .map((ref) => ref.path.replaceFirst('articles/', ''))
        .toList();

    return RubricsStateTypeStruct(
      id: rubricId,
      name: rubric.name,
      isVisible: rubric.isVisible,
      isDeleted: rubric.isDeleted,
      createdTime: rubric.createdTime,
      modifiedTime: rubric.modifiedTime,
      articlesDocs: articlesDocs,
      icon: rubric.icon,
      editor: rubric.editor,
      banner: rubric.banner,
      iconImage: rubric.iconImage,
    );
  }).toList();

  // Обновляем состояние приложения
  FFAppState().update(() {
    FFAppState().RubricsState = rubricsStateList;
  });

  // Логируем результат
  debugPrint(
    '[getRubrics] Успешно обновлено состояние рубрик. '
    'Количество элементов: ${rubricsStateList.length}.',
  );
}
