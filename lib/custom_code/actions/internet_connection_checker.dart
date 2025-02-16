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

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future internetConnectionChecker() async {
  if (FFAppState().enableInternetChecker) {
    //final internetConnection = InternetConnection();
    final internetConnection = InternetConnection.createInstance(
      customCheckOptions: [
        InternetCheckOption(uri: Uri.parse('https://gazeta.ru')),
        InternetCheckOption(uri: Uri.parse('https://vk.com')),
      ],
    );
    internetConnection.onStatusChange.listen((InternetStatus status) async {
      switch (status) {
        case InternetStatus.connected:
          FFAppState().hasInternet = true;
          break;
        case InternetStatus.disconnected:
          //await Future.delayed(Duration(seconds: 5));
          FFAppState().hasInternet = false;
          break;
      }
    });
  } else {
    FFAppState().hasInternet = true;
  }
}
