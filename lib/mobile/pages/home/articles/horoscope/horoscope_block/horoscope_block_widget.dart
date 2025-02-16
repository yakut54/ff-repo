import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/horoscope/zodiac_icon/zodiac_icon_widget.dart';
import '/mobile/pages/home/articles/horoscope/zodiac_image_container/zodiac_image_container_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'horoscope_block_model.dart';
export 'horoscope_block_model.dart';

class HoroscopeBlockWidget extends StatefulWidget {
  const HoroscopeBlockWidget({
    super.key,
    required this.block,
  });

  final HoroscopeBlockStruct? block;

  @override
  State<HoroscopeBlockWidget> createState() => _HoroscopeBlockWidgetState();
}

class _HoroscopeBlockWidgetState extends State<HoroscopeBlockWidget> {
  late HoroscopeBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopeBlockModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wrapWithModel(
          model: _model.zodiacImageContainerModel,
          updateCallback: () => safeSetState(() {}),
          child: ZodiacImageContainerWidget(
            zodiac: widget.block!.zodiac!,
          ),
        ),
        Text(
          widget.block!.title,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Akrobat',
                color: Color(0xFF312D34),
                fontSize: 17.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: false,
              ),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.zodiacIconModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ZodiacIconWidget(
                      zodiac: widget.block!.zodiac!,
                    ),
                  ),
                  Text(
                    'Мужчина-${functions.zodiacGetSigh(widget.block!.zodiac!)}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          color: Color(0xFF312D34),
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Text(
                widget.block!.forMen,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Akrobat',
                      color: Color(0xFF312D34),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.zodiacIconModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: ZodiacIconWidget(
                    zodiac: widget.block!.zodiac!,
                  ),
                ),
                Text(
                  'Женщина-${functions.zodiacGetSigh(widget.block!.zodiac!)}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Akrobat',
                        color: Color(0xFF312D34),
                        fontSize: 17.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Text(
              widget.block!.forWomen,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Akrobat',
                    color: Color(0xFF312D34),
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.zodiacIconModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: ZodiacIconWidget(
                    zodiac: widget.block!.zodiac!,
                  ),
                ),
                Text(
                  'Совет недели для ${functions.zodiacGetAdviceSigh(widget.block!.zodiac!)}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Akrobat',
                        color: Color(0xFF312D34),
                        fontSize: 17.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Text(
              widget.block!.advice,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Akrobat',
                    color: Color(0xFF312D34),
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
