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

bool smscCodeChecker(
  String code,
  OtpStruct otp,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final ttl = 600000;
  final now = DateTime.now().millisecondsSinceEpoch;
  final codeCreatedTime = otp.createdTime?.millisecondsSinceEpoch ?? 0;
  return otp.code == code && (now - codeCreatedTime) <= ttl;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
