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

Future changeRibricDataInArticles(
  String rubricName,
  String rubricIcon,
  List<DocumentReference>? articles,
) async {
  final batch = FirebaseFirestore.instance.batch();
  if (articles == null || articles.isEmpty) return;
  for (DocumentReference article in articles) {
    batch.update(article, {
      'additional': {'title': rubricName, 'icon_image': rubricIcon}
    });
  }
  batch.commit();
  // Add your function code here!
}
