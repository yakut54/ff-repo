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

import 'package:appmetrica_plugin/appmetrica_plugin.dart';

Future appMetricaReportWithJson(
  String event,
  dynamic json,
) async {
  if (isAndroid || isiOS) {
    await AppMetrica.reportEventWithJson(event, jsonEncode(json));
  }
}
