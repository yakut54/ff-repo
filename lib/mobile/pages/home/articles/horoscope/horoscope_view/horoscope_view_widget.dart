import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/horoscope/horoscope_blocks_viewer/horoscope_blocks_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'horoscope_view_model.dart';
export 'horoscope_view_model.dart';

class HoroscopeViewWidget extends StatefulWidget {
  const HoroscopeViewWidget({
    super.key,
    required this.articleDoc,
    required this.rubricDoc,
  });

  final ArticlesRecord? articleDoc;
  final RubricsRecord? rubricDoc;

  @override
  State<HoroscopeViewWidget> createState() => _HoroscopeViewWidgetState();
}

class _HoroscopeViewWidgetState extends State<HoroscopeViewWidget> {
  late HoroscopeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HoroscopeViewModel());

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
      children: [
        if (widget.articleDoc?.advice != null &&
            widget.articleDoc?.advice != '')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Совет недели',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    widget.articleDoc!.advice,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Гороскоп на неделю по всем знакам зодиака',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ].divide(SizedBox(height: 16.0)),
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 10.0, 0.0),
          child: wrapWithModel(
            model: _model.horoscopeBlocksViewerModel,
            updateCallback: () => safeSetState(() {}),
            child: HoroscopeBlocksViewerWidget(
              blockList: widget.articleDoc!.horoscopeBlocks,
            ),
          ),
        ),
      ],
    );
  }
}
