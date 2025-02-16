import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future updateOnlineStatus(BuildContext context) async {
  unawaited(
    () async {
      await actions.updateUserOnlineStatus();
    }(),
  );
}

Future<bool> canLoad(BuildContext context) async {
  return FFAppState().hasInternet && !FFAppState().hasVPN;
}

Future isArticleSupported(BuildContext context) async {}
