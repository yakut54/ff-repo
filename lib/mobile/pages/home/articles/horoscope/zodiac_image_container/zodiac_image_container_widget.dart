import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'zodiac_image_container_model.dart';
export 'zodiac_image_container_model.dart';

class ZodiacImageContainerWidget extends StatefulWidget {
  const ZodiacImageContainerWidget({
    super.key,
    required this.zodiac,
  });

  final Zodiac? zodiac;

  @override
  State<ZodiacImageContainerWidget> createState() =>
      _ZodiacImageContainerWidgetState();
}

class _ZodiacImageContainerWidgetState
    extends State<ZodiacImageContainerWidget> {
  late ZodiacImageContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZodiacImageContainerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/horoscope_container_background.jpeg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xCC089994),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    functions.zodiacGetSigh(widget.zodiac!),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget.zodiac == Zodiac.aries) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/aries_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.taurus) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/taurus_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.gemini) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/gemini_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.cancer) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/cancer_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.leo) {
                      return Image.asset(
                        'assets/images/leo_image.png',
                        height: 200.0,
                        fit: BoxFit.contain,
                      );
                    } else if (widget.zodiac == Zodiac.virgo) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/virgo_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.libra) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/libra_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.scorpio) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/scorpio_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.sagittarius) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/sagittarius_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.capricorn) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/capricorn_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.aquarius) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/aquarius_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (widget.zodiac == Zodiac.pisces) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/pisces_image.png',
                          height: 200.0,
                          fit: BoxFit.contain,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
