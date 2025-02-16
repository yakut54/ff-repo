import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'feed_bottom_bar_model.dart';
export 'feed_bottom_bar_model.dart';

class FeedBottomBarWidget extends StatefulWidget {
  const FeedBottomBarWidget({
    super.key,
    required this.onCommentsPressed,
    bool? realtimeUpdate,
    bool? showShare,
    required this.articleDoc,
    Color? backgroundColor,
    this.onSharePressed,
  })  : this.realtimeUpdate = realtimeUpdate ?? false,
        this.showShare = showShare ?? false,
        this.backgroundColor = backgroundColor ?? const Color(0x00FFFFFF);

  final Future Function()? onCommentsPressed;
  final bool realtimeUpdate;
  final bool showShare;
  final ArticlesRecord? articleDoc;
  final Color backgroundColor;
  final Future Function()? onSharePressed;

  @override
  State<FeedBottomBarWidget> createState() => _FeedBottomBarWidgetState();
}

class _FeedBottomBarWidgetState extends State<FeedBottomBarWidget> {
  late FeedBottomBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedBottomBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
          ),
          child: Builder(
            builder: (context) {
              if (widget.realtimeUpdate) {
                return StreamBuilder<ArticlesRecord>(
                  stream:
                      ArticlesRecord.getDocument(widget.articleDoc!.reference),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return SvgPicture.asset(
                        'assets/images/Rectangle_1996.svg',
                        width: 1.0,
                        height: 1.0,
                      );
                    }

                    final rowArticlesRecord = snapshot.data!;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (rowArticlesRecord.likes
                                    .contains(currentUserReference)) {
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      if (rowArticlesRecord.likes
                                          .contains(currentUserReference)) {
                                        unawaited(
                                          () async {
                                            await widget.articleDoc!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'likes':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }(),
                                        );
                                      } else {
                                        unawaited(
                                          () async {
                                            await widget.articleDoc!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'likes':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }(),
                                        );
                                      }

                                      unawaited(
                                        () async {
                                          await action_blocks
                                              .updateOnlineStatus(context);
                                        }(),
                                      );
                                    },
                                    text: valueOrDefault<String>(
                                      rowArticlesRecord.likes.length.toString(),
                                      '0',
                                    ),
                                    icon: Icon(
                                      FFIcons.kliked,
                                      color: Color(0xFFCB0000),
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 29.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 6.0, 8.0, 6.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFF1EFEE),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                                      if (widget.articleDoc!.likes
                                          .contains(currentUserReference)) {
                                        unawaited(
                                          () async {
                                            await widget.articleDoc!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'likes':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }(),
                                        );
                                      } else {
                                        unawaited(
                                          () async {
                                            await widget.articleDoc!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'likes':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                          }(),
                                        );
                                      }

                                      unawaited(
                                        () async {
                                          await action_blocks
                                              .updateOnlineStatus(context);
                                        }(),
                                      );
                                    },
                                    text: valueOrDefault<String>(
                                      rowArticlesRecord.likes.length.toString(),
                                      '0',
                                    ),
                                    icon: Icon(
                                      FFIcons.knotLiked,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 29.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 6.0, 8.0, 6.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFF1EFEE),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                            if (widget.articleDoc?.type != Editor.link
                                ? ((currentUserDocument?.role != Role.guest) ||
                                    (currentUserDocument?.role ==
                                        Role.administrator) ||
                                    (currentUserDocument?.role ==
                                        Role.developer))
                                : false)
                              AuthUserStreamWidget(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    await widget.onCommentsPressed?.call();
                                    unawaited(
                                      () async {
                                        await action_blocks
                                            .updateOnlineStatus(context);
                                      }(),
                                    );
                                  },
                                  text: valueOrDefault<String>(
                                    rowArticlesRecord.comments.length
                                        .toString(),
                                    '0',
                                  ),
                                  icon: Icon(
                                    FFIcons.kcomments,
                                    size: 18.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 29.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 6.0, 8.0, 6.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFF1EFEE),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
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
                              ),
                            if (widget.showShare)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.onSharePressed?.call();
                                },
                                child: Container(
                                  height: 29.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF1EFEE),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Icon(
                                        FFIcons.kshare,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 19.0,
                                      ),
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
                                rowArticlesRecord.views.length.toString(),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if (widget.articleDoc?.likes
                                    .contains(currentUserReference) ??
                                false) {
                              return FFButtonWidget(
                                onPressed: () async {
                                  if (widget.articleDoc!.likes
                                      .contains(currentUserReference)) {
                                    unawaited(
                                      () async {
                                        await widget.articleDoc!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'likes': FieldValue.arrayRemove(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }(),
                                    );
                                  } else {
                                    unawaited(
                                      () async {
                                        await widget.articleDoc!.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'likes': FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                            },
                                          ),
                                        });
                                      }(),
                                    );
                                  }

                                  unawaited(
                                    () async {
                                      await action_blocks
                                          .updateOnlineStatus(context);
                                    }(),
                                  );
                                },
                                text: widget.articleDoc != null
                                    ? widget.articleDoc!.likes.length
                                        .toString()
                                    : '-',
                                icon: Icon(
                                  FFIcons.kliked,
                                  color: Color(0xFFCB0000),
                                  size: 18.0,
                                ),
                                options: FFButtonOptions(
                                  height: 29.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 6.0, 8.0, 6.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF1EFEE),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                                  if (widget.articleDoc!.likes
                                      .contains(currentUserReference)) {
                                    await widget.articleDoc!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'likes': FieldValue.arrayRemove(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  } else {
                                    await widget.articleDoc!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'likes': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                  }
                                },
                                text: widget.articleDoc != null
                                    ? widget.articleDoc!.likes.length
                                        .toString()
                                    : '-',
                                icon: Icon(
                                  FFIcons.knotLiked,
                                  size: 18.0,
                                ),
                                options: FFButtonOptions(
                                  height: 29.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 6.0, 8.0, 6.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF1EFEE),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
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
                        if (widget.articleDoc?.type != Editor.link
                            ? ((currentUserDocument?.role != Role.guest) ||
                                (currentUserDocument?.role ==
                                    Role.administrator) ||
                                (currentUserDocument?.role == Role.developer))
                            : false)
                          AuthUserStreamWidget(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                await widget.onCommentsPressed?.call();
                                unawaited(
                                  () async {
                                    await action_blocks
                                        .updateOnlineStatus(context);
                                  }(),
                                );
                              },
                              text: widget.articleDoc != null
                                  ? widget.articleDoc!.comments.length
                                      .toString()
                                  : '-',
                              icon: Icon(
                                FFIcons.kcomments,
                                size: 18.0,
                              ),
                              options: FFButtonOptions(
                                height: 29.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 6.0, 8.0, 6.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF1EFEE),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                          ),
                        if (widget.showShare)
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.onSharePressed?.call();
                            },
                            child: Container(
                              height: 29.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF1EFEE),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 5.5, 8.0, 5.5),
                                  child: Icon(
                                    FFIcons.kshare,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 19.0,
                                  ),
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
                            widget.articleDoc != null
                                ? widget.articleDoc?.views.length.toString()
                                : '-',
                            '-',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Akrobat',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ].divide(SizedBox(width: 15.0)),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
