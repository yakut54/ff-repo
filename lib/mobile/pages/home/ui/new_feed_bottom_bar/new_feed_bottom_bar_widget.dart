import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'new_feed_bottom_bar_model.dart';
export 'new_feed_bottom_bar_model.dart';

class NewFeedBottomBarWidget extends StatefulWidget {
  const NewFeedBottomBarWidget({
    super.key,
    required this.articleItem,
    required this.onCommentsPressed,
  });

  final ArticlesStateTypeStruct? articleItem;
  final Future Function()? onCommentsPressed;

  @override
  State<NewFeedBottomBarWidget> createState() => _NewFeedBottomBarWidgetState();
}

class _NewFeedBottomBarWidgetState extends State<NewFeedBottomBarWidget> {
  late NewFeedBottomBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewFeedBottomBarModel());

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
      decoration: BoxDecoration(
        color: Color(0xFFFFF8F7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Builder(
                builder: (context) {
                  if (widget.articleItem?.likes
                          .contains(currentUserReference?.id) ==
                      true) {
                    return FFButtonWidget(
                      onPressed: () async {
                        // ToggleLikeAction
                        await actions.toggleLike(
                          widget.articleItem!,
                          currentUserReference!,
                        );
                        unawaited(
                          () async {}(),
                        );
                      },
                      text: widget.articleItem!.likes.length.toString(),
                      icon: Icon(
                        FFIcons.kliked,
                        color: Color(0xFFCB0000),
                        size: 18.0,
                      ),
                      options: FFButtonOptions(
                        height: 29.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                        iconAlignment: IconAlignment.start,
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFF1EFEE),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                      onPressed: () async {
                        // ToggleLikeAction
                        await actions.toggleLike(
                          widget.articleItem!,
                          currentUserReference!,
                        );
                        unawaited(
                          () async {}(),
                        );
                      },
                      text: widget.articleItem!.likes.length.toString(),
                      icon: Icon(
                        FFIcons.knotLiked,
                        size: 18.0,
                      ),
                      options: FFButtonOptions(
                        height: 29.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFF1EFEE),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
              if (true)
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: widget.articleItem!.comments.length.toString(),
                  icon: Icon(
                    FFIcons.kcomments,
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
                ),
              if (true)
                Container(
                  height: 29.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1EFEE),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 5.5, 8.0, 5.5),
                      child: Icon(
                        FFIcons.kshare,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 19.0,
                      ),
                    ),
                  ),
                ),
            ].divide(SizedBox(width: 16.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                FFIcons.kviews,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 15.0,
              ),
              Text(
                valueOrDefault<String>(
                  widget.articleItem?.views.length.toString(),
                  '100',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Akrobat',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ].divide(SizedBox(width: 15.0)),
          ),
        ],
      ),
    );
  }
}
