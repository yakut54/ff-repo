import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'stories_viewer_model.dart';
export 'stories_viewer_model.dart';

class StoriesViewerWidget extends StatefulWidget {
  const StoriesViewerWidget({
    super.key,
    required this.docs,
    this.initIndex,
  });

  final List<StoriesRecord>? docs;
  final int? initIndex;

  @override
  State<StoriesViewerWidget> createState() => _StoriesViewerWidgetState();
}

class _StoriesViewerWidgetState extends State<StoriesViewerWidget> {
  late StoriesViewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoriesViewerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentIndex = widget.initIndex != null ? widget.initIndex : 0;
      safeSetState(() {});
      _model.timerController.onStartTimer();
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 10),
        callback: (timer) async {
          safeSetState(() {});
        },
        startImmediately: true,
      );
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

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2D2830),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                child: Builder(
                  builder: (context) {
                    final storyItem = widget.docs!.toList();

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(storyItem.length, (storyItemIndex) {
                        final storyItemItem = storyItem[storyItemIndex];
                        return Expanded(
                          child: Container(
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: _model.currentIndex! <= storyItemIndex
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Stack(
                              children: [
                                LinearPercentIndicator(
                                  percent: 1 -
                                      ((100 /
                                              (5000 /
                                                  _model.timerMilliseconds)) *
                                          0.01),
                                  lineHeight: 4.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).primary,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  barRadius: Radius.circular(20.0),
                                  padding: EdgeInsets.zero,
                                ),
                                if (_model.currentIndex != storyItemIndex)
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (_model.currentIndex! <
                                            storyItemIndex) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        } else if (_model.currentIndex ==
                                            storyItemIndex) {
                                          return Color(0x00000000);
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primary;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }).divide(SizedBox(width: 10.0)),
                    );
                  },
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final stories = widget.docs!.toList();

                    return Stack(
                      children: List.generate(stories.length, (storiesIndex) {
                        final storiesItem = stories[storiesIndex];
                        return Visibility(
                          visible: _model.currentIndex == storiesIndex,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 300),
                                        fadeOutDuration:
                                            Duration(milliseconds: 300),
                                        imageUrl: storiesItem.image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.fitWidth,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.currentIndex ==
                                                  (widget.docs!.length - 1)) {
                                                _model.timerController
                                                    .onStopTimer();
                                                Navigator.pop(context);
                                                return;
                                              } else {
                                                _model.currentIndex =
                                                    _model.currentIndex! + 1;
                                                safeSetState(() {});
                                                _model.timerController
                                                    .onResetTimer();

                                                _model.timerController
                                                    .onStartTimer();
                                                return;
                                              }
                                            },
                                            child: Container(
                                              height: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.currentIndex ==
                                                      0) {
                                                    return;
                                                  }

                                                  _model.currentIndex =
                                                      _model.currentIndex! + -1;
                                                  safeSetState(() {});
                                                  _model.timerController
                                                      .onResetTimer();

                                                  _model.timerController
                                                      .onStartTimer();
                                                  return;
                                                },
                                                child: Container(
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (functions.isFriendlyCountry(
                                      FFAppState().countryCode) ||
                                  isWeb)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 16.0, 20.0, 28.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (storiesItem.link != '') {
                                        await launchURL(storiesItem.link);
                                        return;
                                      } else {
                                        return;
                                      }
                                    },
                                    text: valueOrDefault<String>(
                                      storiesItem.buttonText,
                                      'Подробнее',
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
          Opacity(
            opacity: 0.0,
            child: Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: FlutterFlowTimer(
                initialTime: _model.timerInitialTimeMs,
                getDisplayTime: (value) => StopWatchTimer.getDisplayTime(value),
                controller: _model.timerController,
                updateStateInterval: Duration(milliseconds: 50),
                onChanged: (value, displayTime, shouldUpdate) {
                  _model.timerMilliseconds = value;
                  _model.timerValue = displayTime;
                  if (shouldUpdate) safeSetState(() {});
                },
                onEnded: () async {
                  if (_model.currentIndex == (widget.docs!.length - 1)) {
                    Navigator.pop(context);
                    return;
                  } else {
                    _model.currentIndex = _model.currentIndex! + 1;
                    safeSetState(() {});
                    _model.timerController.onResetTimer();

                    _model.timerController.onStartTimer();
                    return;
                  }
                },
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Akrobat',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
