import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web/ui/pop_ups/code_verify_pop_up/code_verify_pop_up_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'change_phone_page_model.dart';
export 'change_phone_page_model.dart';

class ChangePhonePageWidget extends StatefulWidget {
  const ChangePhonePageWidget({
    super.key,
    this.phone,
  });

  final String? phone;

  @override
  State<ChangePhonePageWidget> createState() => _ChangePhonePageWidgetState();
}

class _ChangePhonePageWidgetState extends State<ChangePhonePageWidget> {
  late ChangePhonePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePhonePageModel());

    _model.textController ??= TextEditingController(text: widget.phone);
    _model.textFieldFocusNode ??= FocusNode();

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
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Изменить номер',
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
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Телефон',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Akrobat',
                            color: Color(0xFFAAA7AC),
                            fontSize: 17.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '+7',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Akrobat',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 100),
                              () async {
                                var _shouldSetState = false;
                                if (functions.isTextLessThen(
                                    _model.textController.text, 10)) {
                                  _model.userExists = false;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  _model.user = await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'phone_number',
                                      isEqualTo: '+7${(String phone) {
                                        return phone.replaceAll('-', '');
                                      }(_model.textController.text)}',
                                    ),
                                    limit: 1,
                                  );
                                  _shouldSetState = true;
                                  _model.userExists = _model.user != null &&
                                      (_model.user)!.isNotEmpty;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (_shouldSetState) safeSetState(() {});
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              if (functions.smscCanSendMessage(
                                  _model.textController.text,
                                  FFAppState().otp)) {
                                FFAppState().updateOtpStruct(
                                  (e) => e
                                    ..createdTime = getCurrentTimestamp
                                    ..phone = _model.textController.text
                                    ..code = functions.smscGenerateCode(),
                                );
                                if ((String phone) {
                                  return phone.startsWith('9');
                                }(_model.textController.text)) {
                                  _model.apiResult3a8 = await SmscCall.call(
                                    mes: functions
                                        .smscMessage(FFAppState().otp.code),
                                    phones: '7${FFAppState().otp.phone}',
                                  );
                                }
                              }
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: CodeVerifyPopUpWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(() {});
                            },
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Akrobat',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.none,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            keyboardType: TextInputType.number,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.textFieldMask],
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (_model.userExists &&
                              (((String phone) {
                                    return '+7${phone.replaceAll('-', '')}';
                                  }(_model.textController.text)) !=
                                  currentPhoneNumber)) {
                            return Text(
                              'Пользователь с таким номером уже существует!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    color: FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            );
                          } else {
                            return Text(
                              'На этот номер будет отправлен код подтверждения',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Akrobat',
                                    color: Color(0xFF969298),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                            );
                          }
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
                AuthUserStreamWidget(
                  builder: (context) => FFButtonWidget(
                    onPressed: (functions.isTextLessThen(
                                (String phone) {
                                  return phone.replaceAll('-', '');
                                }(_model.textController.text),
                                10) ||
                            _model.userExists ||
                            (((String phone) {
                                  return '+7${phone.replaceAll('-', '')}';
                                }(_model.textController.text)) ==
                                currentPhoneNumber))
                        ? null
                        : () async {
                            if (functions.smscCanSendMessage(
                                (String phone) {
                                  return phone.replaceAll('-', '');
                                }(_model.textController.text),
                                FFAppState().otp)) {
                              FFAppState().updateOtpStruct(
                                (e) => e
                                  ..createdTime = getCurrentTimestamp
                                  ..phone = (String phone) {
                                    return phone.replaceAll('-', '');
                                  }(_model.textController.text)
                                  ..code = functions.smscGenerateCode(),
                              );
                              if ((String phone) {
                                return phone.startsWith('9');
                              }(FFAppState().otp.phone)) {
                                _model.apiResult3a8ddssdsd =
                                    await SmscCall.call(
                                  mes: functions
                                      .smscMessage(FFAppState().otp.code),
                                  phones: '7${FFAppState().otp.phone}',
                                );
                              }
                            }

                            context.pushNamed('ChangePhoneCodeVerifyPage');

                            safeSetState(() {});
                          },
                    text: 'Далее',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
