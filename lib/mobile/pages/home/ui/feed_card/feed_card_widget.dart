import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/ui/feed_bottom_bar/feed_bottom_bar_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'feed_card_model.dart';
export 'feed_card_model.dart';

class FeedCardWidget extends StatefulWidget {
  const FeedCardWidget({
    super.key,
    required this.articleDoc,
    this.onCommentsPressed,
    this.onTap,
  });

  final ArticlesRecord? articleDoc;
  final Future Function()? onCommentsPressed;
  final Future Function()? onTap;

  @override
  State<FeedCardWidget> createState() => _FeedCardWidgetState();
}

class _FeedCardWidgetState extends State<FeedCardWidget> {
  late FeedCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.rubricsDoc =
          await RubricsRecord.getDocumentOnce(widget.articleDoc!.rubricsRef!);
      if ((_model.rubricsDoc?.name != widget.articleDoc?.additional.title) ||
          (_model.rubricsDoc?.iconImage !=
              widget.articleDoc?.additional.iconImage)) {
        unawaited(
          () async {
            await widget.articleDoc!.reference.update(createArticlesRecordData(
              additional: createFeedAdditionalDataStruct(
                title: _model.rubricsDoc?.name,
                iconImage: _model.rubricsDoc?.iconImage,
                clearUnsetFields: false,
              ),
            ));
          }(),
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.onTap?.call();
          unawaited(
            () async {
              await action_blocks.updateOnlineStatus(context);
            }(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((widget.articleDoc?.additional.title != null &&
                        widget.articleDoc?.additional.title != '') ||
                    (widget.articleDoc?.additional.iconImage != null &&
                        widget.articleDoc?.additional.iconImage != ''))
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            widget.articleDoc!.additional.title,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  color: Color(0xFF024F55),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Visibility(
                          visible: widget.articleDoc?.additional.iconImage !=
                                  null &&
                              widget.articleDoc?.additional.iconImage != '',
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 300),
                            fadeOutDuration: Duration(milliseconds: 300),
                            imageUrl: widget.articleDoc!.additional.iconImage,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                Text(
                  widget.articleDoc!.title,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Akrobat',
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
                if (widget.articleDoc?.description != null &&
                    widget.articleDoc?.description != '')
                  Text(
                    widget.articleDoc!.description,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                Stack(
                  children: [
                    wrapWithModel(
                      model: _model.feedBottomBarModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: FeedBottomBarWidget(
                        realtimeUpdate: false,
                        showShare: false,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        articleDoc: widget.articleDoc!,
                        onCommentsPressed: () async {
                          await widget.onCommentsPressed?.call();
                        },
                        onSharePressed: () async {},
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) => wrapWithModel(
                          model: _model.feedBottomBarModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: FeedBottomBarWidget(
                            realtimeUpdate: true,
                            showShare: false,
                            articleDoc: widget.articleDoc!,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            onCommentsPressed: () async {
                              await widget.onCommentsPressed?.call();
                            },
                            onSharePressed: () async {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
          ),
        ),
      ),
    );
  }
}
