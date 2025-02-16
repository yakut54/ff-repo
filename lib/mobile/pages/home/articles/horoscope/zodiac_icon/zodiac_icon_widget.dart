import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'zodiac_icon_model.dart';
export 'zodiac_icon_model.dart';

class ZodiacIconWidget extends StatefulWidget {
  const ZodiacIconWidget({
    super.key,
    required this.zodiac,
  });

  final Zodiac? zodiac;

  @override
  State<ZodiacIconWidget> createState() => _ZodiacIconWidgetState();
}

class _ZodiacIconWidgetState extends State<ZodiacIconWidget> {
  late ZodiacIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZodiacIconModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          color: Color(0xFF1AC1CC),
          shape: BoxShape.circle,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Builder(
          builder: (context) {
            if (widget.zodiac == Zodiac.aries) {
              return Icon(
                FFIcons.kzodiacAries,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.taurus) {
              return Icon(
                FFIcons.kzodiacTaurus,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.gemini) {
              return Icon(
                FFIcons.kzodiacGemini,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.cancer) {
              return Icon(
                FFIcons.kzodiacCancer,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.leo) {
              return Icon(
                FFIcons.kzodiacLeo,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.virgo) {
              return Icon(
                FFIcons.kzodiacVirgo,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.libra) {
              return Icon(
                FFIcons.kzodiacLibra,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.scorpio) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 1.0, 0.0, 0.0),
                child: Icon(
                  FFIcons.kzodiacScorpio,
                  color: _model.iconColor,
                  size: 8.0,
                ),
              );
            } else if (widget.zodiac == Zodiac.sagittarius) {
              return Icon(
                FFIcons.kzodiacSagittarius,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.capricorn) {
              return Icon(
                FFIcons.kzodiacCapricorn,
                color: _model.iconColor,
                size: 8.0,
              );
            } else if (widget.zodiac == Zodiac.aquarius) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                child: Icon(
                  FFIcons.kzodiacAquarius,
                  color: _model.iconColor,
                  size: 6.0,
                ),
              );
            } else if (widget.zodiac == Zodiac.pisces) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                child: Icon(
                  FFIcons.kzodiacCancer,
                  color: _model.iconColor,
                  size: 8.0,
                ),
              );
            } else {
              return Container(
                width: 0.0,
                height: 0.0,
                decoration: BoxDecoration(),
              );
            }
          },
        ),
      ),
    );
  }
}
