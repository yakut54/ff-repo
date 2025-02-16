import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'article_block_model.dart';
export 'article_block_model.dart';

class ArticleBlockWidget extends StatefulWidget {
  const ArticleBlockWidget({
    super.key,
    required this.articleBlock,
    this.onChange,
  });

  final ArticleBlockStruct? articleBlock;
  final Future Function(ArticleBlockStruct articleBlock)? onChange;

  @override
  State<ArticleBlockWidget> createState() => _ArticleBlockWidgetState();
}

class _ArticleBlockWidgetState extends State<ArticleBlockWidget> {
  late ArticleBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticleBlockModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.articleBlock?.type == ArticleBlockType.image) {
        _model.image = widget.articleBlock?.image;
        safeSetState(() {});
        return;
      } else if (widget.articleBlock?.type == ArticleBlockType.timer) {
      } else {
        return;
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (FFAppState().isNewVersionArticleBlock)
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (widget.articleBlock?.type == ArticleBlockType.text) {
                    return custom_widgets.HtmlToFlutterWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 200.0,
                      text: valueOrDefault<String>(
                        widget.articleBlock?.text,
                        'default text',
                      ),
                      styleKey: 'titleMedium',
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.headerHigh) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: custom_widgets.HtmlToFlutterWidget(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 200.0,
                        text: valueOrDefault<String>(
                          widget.articleBlock?.text,
                          'hz',
                        ),
                        styleKey: 'headlineMedium',
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.headerLow) {
                    return custom_widgets.HtmlToFlutterWidget(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 200.0,
                      text: widget.articleBlock!.text,
                      styleKey: 'headlineMedium',
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget.articleBlock!.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image90) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.9,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image80) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.8,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image70) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.7,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image60) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.6,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image50) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.5,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image40) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.4,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image30) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.3,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image20) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.2,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image10) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        child: custom_widgets.PercentImage(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 200.0,
                          path: widget.articleBlock!.image,
                          percent: 0.1,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.quote) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F2F1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.articleBlock?.text,
                                    '_',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              if (widget.articleBlock?.author != null &&
                                  widget.articleBlock?.author != '')
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.articleBlock?.author,
                                        '_',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.list) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.articleBlock?.text,
                                '_',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.separator) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          height: 4.0,
                          constraints: BoxConstraints(
                            maxWidth: 250.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFDEDCDF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.button) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await launchURL(widget.articleBlock!.link);
                        },
                        text: widget.articleBlock!.text,
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.youtube) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: FlutterFlowYoutubePlayer(
                        url: functions
                            .stringToVideoPath(widget.articleBlock?.link)!,
                        autoPlay: false,
                        looping: true,
                        mute: false,
                        showControls: true,
                        showFullScreen: true,
                        strictRelatedVideos: true,
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.video) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: FlutterFlowVideoPlayer(
                        path: functions
                            .stringToVideoPath(widget.articleBlock?.link)!,
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.timer) {
                    return custom_widgets.FlipClock(
                      width: double.infinity,
                      height: 100.0,
                      dateTime: widget.articleBlock!.time!,
                      digitColor: FlutterFlowTheme.of(context).primary,
                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                    );
                  } else {
                    return Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        if (!FFAppState().isNewVersionArticleBlock)
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (widget.articleBlock?.type == ArticleBlockType.text) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: Text(
                        valueOrDefault<String>(
                          widget.articleBlock?.text,
                          '_',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: Colors.black,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.headerHigh) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: Text(
                        valueOrDefault<String>(
                          widget.articleBlock?.text,
                          '_',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: Colors.black,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.headerLow) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: Text(
                        valueOrDefault<String>(
                          widget.articleBlock?.text,
                          '_',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: Colors.black,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.image) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: widget.articleBlock!.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.quote) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F2F1),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.articleBlock?.text,
                                    '_',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              if (widget.articleBlock?.author != null &&
                                  widget.articleBlock?.author != '')
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.articleBlock?.author,
                                        '_',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.list) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.articleBlock?.text,
                                '_',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.separator) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Container(
                        width: double.infinity,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDEDCDF),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.button) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await launchURL(widget.articleBlock!.link);
                        },
                        text: widget.articleBlock!.text,
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Akrobat',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.youtube) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: FlutterFlowYoutubePlayer(
                        url: functions
                            .stringToVideoPath(widget.articleBlock?.link)!,
                        autoPlay: false,
                        looping: true,
                        mute: false,
                        showControls: true,
                        showFullScreen: true,
                        strictRelatedVideos: true,
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.video) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: FlutterFlowVideoPlayer(
                        path: functions
                            .stringToVideoPath(widget.articleBlock?.link)!,
                        videoType: VideoType.network,
                        autoPlay: false,
                        looping: false,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    );
                  } else if (widget.articleBlock?.type ==
                      ArticleBlockType.timer) {
                    return custom_widgets.FlipClock(
                      width: double.infinity,
                      height: 100.0,
                      dateTime: widget.articleBlock!.time!,
                      digitColor: FlutterFlowTheme.of(context).primary,
                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 7.5, 0.0, 7.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (isiOS) {
                                unawaited(
                                  () async {
                                    await launchURL(
                                        'https://apps.apple.com/app/id6504793921');
                                  }(),
                                );
                              } else {
                                if (isAndroid) {
                                  unawaited(
                                    () async {
                                      await launchURL(
                                          'https://play.google.com/store/apps/details?id=ru.martangg.android');
                                    }(),
                                  );
                                }
                              }

                              Navigator.pop(context);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7E2E4),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'Этот контент не поддерживается вашей версией приложения. Нажмите здесь чтобы перейти в ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      TextSpan(
                                        text: () {
                                          if (isAndroid) {
                                            return 'Google Play';
                                          } else if (isiOS) {
                                            return 'AppStore';
                                          } else {
                                            return 'магазин приложений';
                                          }
                                        }(),
                                        style: TextStyle(),
                                      ),
                                      TextSpan(
                                        text: '.',
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}
