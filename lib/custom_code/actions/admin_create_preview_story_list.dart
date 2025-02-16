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

Future<List<StoriesRecord>> adminCreatePreviewStoryList(
  String? image,
  String? buttonText,
  String? link,
  String? name,
  String? cover,
) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final reference = FirebaseFirestore.instance.doc('stories/test');
  final doc = StoriesRecord.getDocumentFromData(
      createStoriesRecordData(
          buttonText: buttonText,
          link: link,
          image: image,
          name: name ?? '[ История ]',
          coverImage: cover,
          isVisible: true),
      reference);
  return [doc];

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
