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

import 'package:flutter/foundation.dart';

import 'package:appmetrica_plugin/appmetrica_plugin.dart';

Future appMetricaInitialize() async {
  if (isAndroid || isiOS) {
    await AppMetrica.activate(AppMetricaConfig(
        '0684f445-2665-434b-85b4-eb25ada86e77',
        appBuildNumber: int.tryParse(FFAppState().appInfo.build),
        firstActivationAsUpdate: false,
        appVersion: FFAppState().appInfo.version,
        logs: kDebugMode));

    if (DateTime.now()
            .difference(FFAppState().lastAppStartedEventSent ??
                DateTime.fromMillisecondsSinceEpoch(0))
            .inDays !=
        0) {
      await AppMetrica.reportEvent('Запуск приложения');
      FFAppState().lastAppStartedEventSent = DateTime.now();
    }
    if (FFAppState().isFirstInstall) {
      await AppMetrica.reportEvent('Приложение установлено');
      FFAppState().isFirstInstall = false;
    }
  }
}
