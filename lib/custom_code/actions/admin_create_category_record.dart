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

Future<CategoriesRecord?> adminCreateCategoryRecord(
    String? image, String? name, String? tag, bool? isPaid) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final reference = FirebaseFirestore.instance.doc('stories/test');
  CategoriesRecord doc = CategoriesRecord.getDocumentFromData({
    ...createCategoriesRecordData(image: image, name: name, isPaid: isPaid),
    ...mapToFirestore({
      'tags': tag != 'Нет' ? [tag] : []
    })
  }, reference);

  return doc;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
