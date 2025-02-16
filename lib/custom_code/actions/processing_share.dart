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

Future processingShare(BuildContext context, String shareId) async {
  //
  final db = FirebaseFirestore.instance;
  final shareSnapshot = await db.doc('shares/$shareId').get();
  final shareRecord = SharesRecord.fromSnapshot(shareSnapshot);
  final articleRef = shareRecord.articleRef;
  final rubricRef = shareRecord.rubricRef;

  final articleSnapshot = await db.doc('articles/$articleRef').get();
  final articlesRecord = ArticlesRecord.fromSnapshot(articleSnapshot);

  final rubricSnapshot = await db.doc('rubrics/$rubricRef').get();
  final rubricsRecord = RubricsRecord.fromSnapshot(rubricSnapshot);
  context.pushReplacementNamed(
    'ArticlePage',
    queryParameters: {
      'articlesDoc': serializeParam(
        articlesRecord,
        ParamType.Document,
      ),
      'showCommentsOnInit': serializeParam(
        false,
        ParamType.bool,
      ),
      'rubricDoc': serializeParam(
        rubricsRecord,
        ParamType.Document,
      ),
    }.withoutNulls,
    extra: <String, dynamic>{
      'articlesDoc': articlesRecord,
      'rubricDoc': rubricsRecord,
    },
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
