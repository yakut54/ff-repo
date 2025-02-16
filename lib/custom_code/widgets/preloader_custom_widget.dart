// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:loading_animation_widget/loading_animation_widget.dart';

class PreloaderCustomWidget extends StatefulWidget {
  const PreloaderCustomWidget({
    super.key,
    this.width,
    this.height,
    required this.size,
    required this.namePreloader,
  });

  final double? width;
  final double? height;
  final double size;
  final String namePreloader;

  @override
  State<PreloaderCustomWidget> createState() => _PreloaderCustomWidgetState();
}

class _PreloaderCustomWidgetState extends State<PreloaderCustomWidget> {
  @override
  Widget build(BuildContext context) {
    FlutterFlowTheme FFTheme = FlutterFlowTheme.of(context);

    return Center(
      child:
          choicePreloader(widget.namePreloader, widget.size, FFTheme.accent2),
    );
  }
}

Widget choicePreloader(String namePreloader, double size, Color color) {
  switch (namePreloader) {
    case 'newtonCradle':
      return LoadingAnimationWidget.newtonCradle(
        color: color,
        size: size,
      );
    case 'stretchedDots':
      return LoadingAnimationWidget.stretchedDots(
        color: color,
        size: size,
      );
    case 'horizontalRotatingDots':
      return LoadingAnimationWidget.horizontalRotatingDots(
        color: color,
        size: size,
      );
    case 'progressiveDots':
      return LoadingAnimationWidget.progressiveDots(
        color: color,
        size: size,
      );
    case 'staggeredDotsWave':
      return LoadingAnimationWidget.staggeredDotsWave(
        color: color,
        size: size,
      );
    default:
      return LoadingAnimationWidget.newtonCradle(
        color: color,
        size: size,
      );
  }
}
