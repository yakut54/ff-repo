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

import 'package:vpn_connection_detector/vpn_connection_detector.dart';

Future vpnConnectionChecker() async {
  if (FFAppState().enableVpnChecker) {
    final vpnDetector = VpnConnectionDetector();
    vpnDetector.vpnConnectionStream.listen(
        (state) => FFAppState().hasVPN = state == VpnConnectionState.connected);
  } else {
    FFAppState().hasVPN = false;
  }
}
