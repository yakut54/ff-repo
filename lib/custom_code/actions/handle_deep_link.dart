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

import '../../flutter_flow/flutter_flow_util.dart';

import 'dart:io';

import 'package:uni_links/uni_links.dart';

Future handleDeepLink() async {
  if (!isWeb) {
    String? initialLink;
    try {
      initialLink = await getInitialLink();
    } catch (e) {}

    if (initialLink != null) {
      _handleLink(initialLink);
    }
    linkStream.listen((String? link) {
      if (link != null) _handleLink(link);
    }, onError: (err) {});
  }
}

Future<void> _handleLink(String link) async {
  final uri = Uri.parse(link);
  final shareId = uri.queryParameters['share'];
  if (shareId != null) FFAppState().shareId = shareId;
}
