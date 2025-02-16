import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'bottom_test_component_model.dart';
export 'bottom_test_component_model.dart';

class BottomTestComponentWidget extends StatefulWidget {
  const BottomTestComponentWidget({
    super.key,
    required this.articleItemBottom,
  });

  final ArticlesStateTypeStruct? articleItemBottom;

  @override
  State<BottomTestComponentWidget> createState() =>
      _BottomTestComponentWidgetState();
}

class _BottomTestComponentWidgetState extends State<BottomTestComponentWidget> {
  late BottomTestComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomTestComponentModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Builder(
            builder: (context) {
              if (widget.articleItemBottom?.likes
                      .contains(currentUserReference?.id) ==
                  true) {
                return FFButtonWidget(
                  onPressed: () {
                    print('LikeBtn pressed ...');
                  },
                  text: widget.articleItemBottom!.likes.length.toString(),
                  icon: Icon(
                    FFIcons.kliked,
                    color: Color(0xFFCB0000),
                    size: 18.0,
                  ),
                  options: FFButtonOptions(
                    height: 29.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFF1EFEE),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Akrobat',
                          color: Color(0xFF59555C),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  showLoadingIndicator: false,
                );
              } else {
                return FFButtonWidget(
                  onPressed: () {
                    print('NoLikeBtn pressed ...');
                  },
                  text: widget.articleItemBottom!.likes.length.toString(),
                  icon: Icon(
                    FFIcons.knotLiked,
                    size: 18.0,
                  ),
                  options: FFButtonOptions(
                    height: 29.0,
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFF1EFEE),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Akrobat',
                          color: Color(0xFF59555C),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  showLoadingIndicator: false,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
