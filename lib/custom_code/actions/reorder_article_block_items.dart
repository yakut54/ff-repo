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

// Define a function called reorderItems that returns a Future of a list of strings.
// It takes in a list of strings, an old index, and a new index as parameters.
Future<List<ArticleBlockStruct>> reorderArticleBlockItems(
  List<ArticleBlockStruct> list,
  int oldIndex,
  int newIndex,
) async {
  debugPrint('reorderArticleBlockItems: $list');
  // If the item is being moved to a position further down the list
  // (i.e., to a higher index), decrement the newIndex by 1.
  // This adjustment is needed because removing an item from its original
  // position will shift the indices of all subsequent items.
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  // Remove the item from its original position in the list and store
  // it in the 'item' variable.
  final item = list.removeAt(oldIndex);

  // Insert the removed item into its new position in the list.
  list.insert(newIndex, item);

  // Return the modified list.
  debugPrint('reorderArticleBlockItems: $list');
  return list;
}
