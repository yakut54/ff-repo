import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'code_verify_page_model.dart';
export 'code_verify_page_model.dart';

class CodeVerifyPageWidget extends StatefulWidget {
  const CodeVerifyPageWidget({super.key});

  @override
  State<CodeVerifyPageWidget> createState() => _CodeVerifyPageWidgetState();
}

class _CodeVerifyPageWidgetState extends State<CodeVerifyPageWidget> {
  late CodeVerifyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodeVerifyPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStopTimer();
      _model.timerController.timer.setPresetTime(
        mSec: functions.smscGetTimer(FFAppState().otp),
        add: false,
      );
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
      _model.doc = await queryUsersRecordCount(
        queryBuilder: (usersRecord) => usersRecord.where(
          'phone_number',
          isEqualTo: '+7${FFAppState().otp.phone}',
        ),
      );
      _model.userExists = _model.doc! > 0;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Введите код подтверждения',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Akrobat',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'На номер ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              TextSpan(
                                text: '+7-',
                                style: TextStyle(
                                  color: Color(0xFFAAA7AC),
                                ),
                              ),
                              TextSpan(
                                text: functions.sighInFormatPhone(
                                    FFAppState().otp.phone, '-'),
                                style: TextStyle(
                                  color: Color(0xFFAAA7AC),
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' отправлено SMS-сообщение c 6-ти значным кодом подтверждения для входа',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Akrobat',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: false,
                            autoFocus: false,
                            enablePinAutofill: false,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 44.0,
                              fieldWidth: 44.0,
                              borderWidth: 2.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor: _model.incorrectCode
                                  ? Color(0xFFED1C24)
                                  : FlutterFlowTheme.of(context).primaryText,
                              inactiveColor:
                                  FlutterFlowTheme.of(context).alternate,
                              selectedColor:
                                  FlutterFlowTheme.of(context).primaryText,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) async {
                              _model.incorrectCode = false;
                              safeSetState(() {});
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Text(
                                'Код введен неверно, попробуйте еще раз',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      color: _model.incorrectCode
                                          ? Color(0xFFED1C24)
                                          : Colors.transparent,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (_model.timerMilliseconds == 0) {
                                  safeSetState(() {
                                    _model.pinCodeController?.clear();
                                  });
                                  FFAppState().updateOtpStruct(
                                    (e) => e
                                      ..createdTime = getCurrentTimestamp
                                      ..code = functions.smscGenerateCode(),
                                  );
                                  safeSetState(() {});
                                  if ((String phone) {
                                    return phone.startsWith('9');
                                  }(FFAppState().otp.phone)) {
                                    _model.apiResult3a8 = await SmscCall.call(
                                      mes: functions
                                          .smscMessage(FFAppState().otp.code),
                                      phones: '7${FFAppState().otp.phone}',
                                    );
                                  }
                                  _model.timerController.timer.setPresetTime(
                                    mSec: functions
                                        .smscGetTimer(FFAppState().otp),
                                    add: false,
                                  );
                                  _model.timerController.onResetTimer();

                                  _model.timerController.onStartTimer();
                                }

                                safeSetState(() {});
                              },
                              child: Text(
                                _model.timerMilliseconds > 1000
                                    ? 'Отправить код подтверждения повторно через'
                                    : 'Отправить код подтверждения повторно',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      color: Color(0xFFAAA7AC),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            if (_model.timerMilliseconds > 1000)
                              FlutterFlowTimer(
                                initialTime: _model.timerInitialTimeMs,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  milliSecond: false,
                                ),
                                controller: _model.timerController,
                                updateStateInterval:
                                    Duration(milliseconds: 1000),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) safeSetState(() {});
                                },
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Akrobat',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                          ],
                        ),
                      ),
                      if (kDebugMode)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Debug:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Akrobat',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Phone: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFAppState().otp.phone,
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Code: ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    TextSpan(
                                      text: FFAppState().otp.code,
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (_model.userExists) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: functions.isTextLessThen(
                                  _model.pinCodeController!.text, 6)
                              ? null
                              : () async {
                                  Function() _navigate = () {};
                                  if ((_model.pinCodeController!.text ==
                                          FFAppState().otp.code) ||
                                      ((_model.pinCodeController!.text ==
                                              '321321') &&
                                          (FFAppState().otp.phone ==
                                              '0125438967'))) {
                                    _model.incorrectCode = false;
                                    safeSetState(() {});

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      isDeleted: true,
                                    ));
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    _navigate = () => context.goNamedAuth(
                                        'SplashScreen', context.mounted);
                                    GoRouter.of(context).prepareAuthEvent();

                                    final user =
                                        await authManager.signInWithEmail(
                                      context,
                                      '+7${FFAppState().otp.phone}@martang.ru',
                                      'ru.martang',
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    _navigate = () => context.goNamedAuth(
                                        'SplashScreenAuth', context.mounted);

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      isDeleted: false,
                                    ));
                                    FFAppState().otp = OtpStruct();
                                    FFAppState().update(() {});

                                    _navigate();
                                    return;
                                  } else {
                                    _model.incorrectCode = true;
                                    safeSetState(() {});
                                    return;
                                  }

                                  _navigate();
                                },
                          text: 'Подтвердить',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Akrobat',
                                  color: Colors.white,
                                  fontSize: 19.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: Color(0xFFD4D2D6),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            45.0, 0.0, 45.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: functions.isTextLessThen(
                                  _model.pinCodeController!.text, 6)
                              ? null
                              : () async {
                                  Function() _navigate = () {};
                                  if (_model.pinCodeController!.text ==
                                      FFAppState().otp.code) {
                                    _model.incorrectCode = false;
                                    safeSetState(() {});
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    _navigate = () => context.goNamedAuth(
                                        'SplashScreen', context.mounted);
                                    GoRouter.of(context).prepareAuthEvent();
                                    if ('ru.martang' != 'ru.martang') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Passwords don\'t match!',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    final user = await authManager
                                        .createAccountWithEmail(
                                      context,
                                      '+7${FFAppState().otp.phone}@martang.ru',
                                      'ru.martang',
                                    );
                                    if (user == null) {
                                      return;
                                    }

                                    await UsersRecord.collection
                                        .doc(user.uid)
                                        .update(createUsersRecordData(
                                          fromUid: FFAppState().anonymousId,
                                          isDeleted: false,
                                          role: Role.user,
                                          phoneNumber: (String phone) {
                                            return '+7$phone';
                                          }(FFAppState().otp.phone),
                                        ));

                                    _navigate = () => context.goNamedAuth(
                                        'SplashScreenAuth', context.mounted);
                                    unawaited(
                                      () async {
                                        await actions.appMetricaReportWithJson(
                                          'Создание пользователя',
                                          <String, String>{
                                            'UID': currentUserReference!.id,
                                          },
                                        );
                                      }(),
                                    );
                                    FFAppState().otp = OtpStruct();
                                    FFAppState().anonymousId = '';
                                    FFAppState().update(() {});

                                    _navigate();
                                    return;
                                  } else {
                                    _model.incorrectCode = true;
                                    safeSetState(() {});
                                    return;
                                  }

                                  _navigate();
                                },
                          text: 'Войти',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Akrobat',
                                  color: Colors.white,
                                  fontSize: 19.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor: Color(0xFFD4D2D6),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
