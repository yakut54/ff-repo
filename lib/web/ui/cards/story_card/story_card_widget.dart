import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'story_card_model.dart';
export 'story_card_model.dart';

class StoryCardWidget extends StatefulWidget {
  const StoryCardWidget({
    super.key,
    required this.doc,
    required this.type,
    this.onHideTap,
    this.onEditTap,
    this.onDeleteTap,
    this.onTap,
  });

  final StoriesRecord? doc;
  final StoryCardType? type;
  final Future Function()? onHideTap;
  final Future Function()? onEditTap;
  final Future Function()? onDeleteTap;
  final Future Function()? onTap;

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget> {
  late StoryCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Container(
        width: () {
          if (widget.type == StoryCardType.big) {
            return 146.0;
          } else if (widget.type == StoryCardType.little) {
            return 86.0;
          } else {
            return 86.0;
          }
        }(),
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: () {
                if (widget.type == StoryCardType.big) {
                  return 146.0;
                } else if (widget.type == StoryCardType.little) {
                  return 86.0;
                } else {
                  return 86.0;
                }
              }(),
              height: () {
                if (widget.type == StoryCardType.big) {
                  return 146.0;
                } else if (widget.type == StoryCardType.little) {
                  return 86.0;
                } else {
                  return 86.0;
                }
              }(),
              decoration: BoxDecoration(
                color: Color(0xFFF3F1F4),
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Stack(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  children: [
                    if (widget.doc?.isVisible ?? true)
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 300),
                            fadeOutDuration: Duration(milliseconds: 300),
                            imageUrl: widget.doc!.coverImage,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (widget.type == StoryCardType.big)
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: !widget.doc!.isVisible,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'История',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Akrobat',
                                                color: Color(0xFF2D2830),
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          'скрыта',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Akrobat',
                                                color: Color(0xFF2D2830),
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: widget.doc!.isVisible
                                        ? Color(0x80000000)
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await widget.onDeleteTap?.call();
                                          },
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: widget.doc!.isVisible
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0xFF969298),
                                            size: 24.0,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await widget.onEditTap?.call();
                                              },
                                              child: Icon(
                                                Icons.edit_outlined,
                                                color: widget.doc!.isVisible
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0xFF969298),
                                                size: 24.0,
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await widget.onHideTap?.call();
                                              },
                                              child: Icon(
                                                Icons.visibility_sharp,
                                                color: widget.doc!.isVisible
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0xFF2D2830),
                                                size: 24.0,
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.doc?.name,
                    ' История',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Akrobat',
                        fontSize: () {
                          if (widget.type == StoryCardType.big) {
                            return 17.0;
                          } else if (widget.type == StoryCardType.little) {
                            return 12.0;
                          } else {
                            return 12.0;
                          }
                        }(),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
