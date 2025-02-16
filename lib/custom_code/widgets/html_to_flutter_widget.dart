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

import 'package:url_launcher/url_launcher.dart';

import 'index.dart'; // Imports other custom widgets

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlToFlutterWidget extends StatelessWidget {
  const HtmlToFlutterWidget({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.styleKey,
  });

  final double? width;
  final double? height;
  final String text;
  final String styleKey;

  TextStyle getPropertyByKey(FlutterFlowTheme theme, String styleKey) {
    switch (styleKey) {
      case 'titleMedium':
        return theme.titleMedium;
      case 'titleLarge':
        return theme.titleLarge;
      case 'headlineMedium':
        return theme.headlineMedium;
      default:
        throw ArgumentError('Invalid property name: $styleKey');
    }
  }

  String getFontFamily(FlutterFlowTheme theme, String styleKey) {
    switch (styleKey) {
      case 'titleMedium':
        return theme.titleMediumFamily;
      case 'titleLarge':
        return theme.titleLargeFamily;
      case 'headlineMedium':
        return theme.headlineMediumFamily;
      default:
        throw ArgumentError('Invalid property name: $styleKey');
    }
  }

  double getFontSize(FlutterFlowTheme theme, String styleKey) {
    switch (styleKey) {
      case 'titleMedium':
        return 18.0;
      case 'titleLarge':
        return theme.titleLarge.fontSize ?? 21.0;
      case 'headlineMedium':
        return theme.headlineMedium.fontSize ?? 26.0;
      default:
        throw ArgumentError('Invalid property name: $styleKey');
    }
  }

  Color getFontColor(FlutterFlowTheme theme, String styleKey) {
    switch (styleKey) {
      case 'titleMedium':
        return theme.titleMedium.color ?? Colors.black;
      case 'titleLarge':
        return theme.titleLarge.color ?? Colors.black;
      case 'headlineMedium':
        return theme.headlineMedium.color ?? Colors.black;
      default:
        throw ArgumentError('Invalid property name: $styleKey');
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterFlowTheme FFTheme = FlutterFlowTheme.of(context);
    TextStyle style = getPropertyByKey(FFTheme, styleKey);
    String fontFamily = getFontFamily(FFTheme, styleKey);
    double fontSize = getFontSize(FFTheme, styleKey);

    TextStyle fontStyle = style.override(
      fontFamily: fontFamily,
      letterSpacing: 0.0,
      lineHeight: 1.2,
      fontSize: fontSize,
      color: Colors.black,
      useGoogleFonts: GoogleFonts.asMap().containsKey(fontFamily),
    );

    return HtmlWidget(
      text,
      renderMode: RenderMode.column,
      customStylesBuilder: customStylesBuilder,
      textStyle: fontStyle,
      onTapUrl: (url) async {
        print('tapped $url');
        final Uri uri = Uri.parse(url);

        try {
          await launchUrl(uri);
          return true;
        } catch (e) {
          print('Could not launch $url: $e');
          return false;
        }
      },
    );
  }
}

StylesMap? customStylesBuilder(element) {
  if (element.classes.contains('h3-center')) {
    return {
      'padding-bottom': '0',
      'margin-bottom': '0',
      'text-align': 'center',
    };
  }

  if (element.classes.contains('paragraph-20')) {
    return {
      'padding-bottom': '6px',
      'padding-top': '6px',
      'font-size': '20px',
      'line-height': '1.4',
      'margin-top': '0',
    };
  }

  if (element.classes.contains('paragraph')) {
    return {
      'padding-bottom': '6px',
      'padding-top': '6px',
      'font-size': '18px',
      'line-height': '1.4',
      'margin-top': '0',
    };
  }

  if (element.classes.contains('paragraph-li')) {
    return {
      'font-size': '18px',
      'line-height': '1.4',
      'margin-top': '0',
    };
  }

  if (element.classes.contains('splash-h3')) {
    return {
      'font-weight': '600',
      'text-align': 'center',
    };
  }

  if (element.classes.contains('splash-h6')) {
    return {
      'text-align': 'center',
    };
  }

  if (element.classes.contains('center')) {
    return {
      'text-align': 'center',
      'padding-bottom': '6px',
    };
  }

  if (element.classes.contains('paragraph-20-center')) {
    return {
      'text-align': 'center',
      'padding-bottom': '6px',
      'padding-top': '6px',
      'font-size': '20px',
      'line-height': '1.4',
      'margin-top': '0',
    };
  }

  if (element.classes.contains('paragraph-center')) {
    return {
      'text-align': 'center',
      'padding-bottom': '6px',
      'padding-top': '6px',
      'font-size': '18px',
      'line-height': '1.4',
      'margin-top': '0',
    };
  }

  if (element.classes.contains('list-ol')) {
    return {
      'list-style-type': 'decimal',
      'padding-left': '25px',
    };
  }

  if (element.localName == 'li') {
    return {
      'padding-bottom': '0px',
      'margin-bottom': '0px',
    };
  }

  if (element.localName == 'a') {
    return {
      'color': 'blue',
    };
  }

  if (element.localName == 'ul') {
    return {
      'margin-bottom': '0px',
      'padding-bottom': '0px',
      'padding-left': '25px',
    };
  }

  return null;
}
