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

import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';

Future changePhoneCall(OtpStruct otp) async {
  // Add your function code here!
  final phone = otp.phone;
  try {
    await FirebaseFunctions.instanceFor(region: 'europe-central2')
        .httpsCallable('changeUserPhoneCall')
        .call({'phone': phone});
  } catch (e) {
    log('$e');
  }
}
