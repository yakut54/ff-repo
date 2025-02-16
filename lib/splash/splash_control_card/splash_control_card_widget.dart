import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/splash/splash_delete_alert/splash_delete_alert_widget.dart';
import '/splash/splash_edit_pop_up/splash_edit_pop_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'splash_control_card_model.dart';
export 'splash_control_card_model.dart';

class SplashControlCardWidget extends StatefulWidget {
  const SplashControlCardWidget({
    super.key,
    this.parameter1,
  });

  final NewSplashsRecord? parameter1;

  @override
  State<SplashControlCardWidget> createState() =>
      _SplashControlCardWidgetState();
}

class _SplashControlCardWidgetState extends State<SplashControlCardWidget>
    with TickerProviderStateMixin {
  late SplashControlCardModel _model;

  var hasIconTriggered1 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashControlCardModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
      'iconOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 190.0,
        height: 270.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFEEEFFF)],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(1.0, -1.0),
            end: AlignmentDirectional(-1.0, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.parameter1?.image,
                                'https://firebasestorage.googleapis.com/v0/b/test-5-81007.appspot.com/o/quokka.jpg?alt=media&token=5b5cdd4a-3a57-48ab-bc72-41361656e91d',
                              ),
                              height: 160.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 10.0, 0.0),
                        child: SelectionArea(
                            child: Text(
                          valueOrDefault<String>(
                            widget.parameter1?.title,
                            'Без заголовка',
                          ).maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Akrobat',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        )),
                      ),
                    ],
                  ),
                ),
                if (!widget.parameter1!.isVisible)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x9A6B6B6B),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Скрыто',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Akrobat',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 30.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.underline,
                                  useGoogleFonts: false,
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
                        color: Color(0x80000000),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MouseRegion(
                              opaque: false,
                              cursor: MouseCursor.defer ?? MouseCursor.defer,
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SplashDeleteAlertWidget(
                                            splashDocItem: widget.parameter1!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation1']!,
                                  hasBeenTriggered: hasIconTriggered1),
                              onEnter: ((event) async {
                                safeSetState(
                                    () => _model.deleteMouseHovered = true);
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation1'] !=
                                    null) {
                                  safeSetState(() => hasIconTriggered1 = true);
                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
                                              'iconOnActionTriggerAnimation1']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                              }),
                              onExit: ((event) async {
                                safeSetState(
                                    () => _model.deleteMouseHovered = false);
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation1'] !=
                                    null) {
                                  await animationsMap[
                                          'iconOnActionTriggerAnimation1']!
                                      .controller
                                      .reverse();
                                }
                              }),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SplashEditPopUpWidget(
                                                doc: widget.parameter1,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconOnActionTriggerAnimation2']!,
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(
                                        () => _model.editMouseHovered = true);
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(
                                        () => _model.editMouseHovered = false);
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
                                  }),
                                ),
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: Visibility(
                                    visible:
                                        widget.parameter1?.isVisible ?? true,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.parameter1!.reference
                                            .update(createNewSplashsRecordData(
                                          isVisible:
                                              !widget.parameter1!.isVisible,
                                        ));
                                      },
                                      child: Icon(
                                        Icons.visibility_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation3']!,
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() => _model
                                        .isVisibleIconMouseHovered = true);
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation3'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation3']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() => _model
                                        .isVisibleIconMouseHovered = false);
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation3'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation3']!
                                          .controller
                                          .reverse();
                                    }
                                  }),
                                ),
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: Visibility(
                                    visible: !widget.parameter1!.isVisible,
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.parameter1!.reference
                                            .update(createNewSplashsRecordData(
                                          isVisible:
                                              !widget.parameter1!.isVisible,
                                        ));
                                      },
                                      child: Icon(
                                        Icons.visibility_off,
                                        color: Color(0xFF8D7E7E),
                                        size: 24.0,
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'iconOnActionTriggerAnimation4']!,
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() => _model
                                        .isNotVisibleIconMouseHovered = true);
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation4'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation4']!
                                          .controller
                                          .forward(from: 0.0);
                                    }
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() => _model
                                        .isNotVisibleIconMouseHovered = false);
                                    if (animationsMap[
                                            'iconOnActionTriggerAnimation4'] !=
                                        null) {
                                      await animationsMap[
                                              'iconOnActionTriggerAnimation4']!
                                          .controller
                                          .reverse();
                                    }
                                  }),
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
        ),
      ),
    );
  }
}
