import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notification_pop_up_model.dart';
export 'notification_pop_up_model.dart';

class NotificationPopUpWidget extends StatefulWidget {
  const NotificationPopUpWidget({
    super.key,
    this.doc,
    bool? isDublicate,
  }) : this.isDublicate = isDublicate ?? false;

  final FfPushNotificationsQueueRecord? doc;
  final bool isDublicate;

  @override
  State<NotificationPopUpWidget> createState() =>
      _NotificationPopUpWidgetState();
}

class _NotificationPopUpWidgetState extends State<NotificationPopUpWidget> {
  late NotificationPopUpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationPopUpModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.date = (widget.doc != null) && !widget.isDublicate
          ? functions.convertDateStringToDateTime(widget.doc?.dispatchTime)
          : getCurrentTimestamp;
      _model.time = (widget.doc != null) && !widget.isDublicate
          ? functions.convertDateStringToDateTime(widget.doc?.dispatchTime)
          : getCurrentTimestamp;
      _model.dispatchDate = (String? date) {
        return date?.split(' ').first ?? '[ Выберите дату ]';
      }(functions.convertDateTimeToString(_model.date));
      _model.dispatchTime = (String? time) {
        return time?.split(' ').last ?? '[ Выберите время ]';
      }(functions.convertDateTimeToString(_model.time));
      safeSetState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: widget.doc?.notificationTitle);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.doc?.notificationText);
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isWeb,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsets.all(100.0),
          child: Container(
            width: 590.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  (widget.doc == null) || widget.isDublicate
                                      ? 'Создание уведомления'
                                      : 'Редактирование уведомления',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Akrobat',
                                        fontSize: 26.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) => FlutterFlowIconButton(
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    if (functions.adminCanCloseNotificationPopUp(
                                        widget.doc,
                                        _model.textController1.text,
                                        _model.textController2.text,
                                        '${_model.dispatchDate} ${_model.dispatchTime}')) {
                                      Navigator.pop(context);
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: AdminAppPopUpWidget(
                                                text:
                                                    'Вы действительно хотите закрыть окно? Все не сохраненные данные будут потеряны!',
                                                leftBtnText: 'Отмена',
                                                rightBtnText: 'Закрыть',
                                                onLBtnPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                onRBtnPressed: () async {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Заголовок уведомления',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF969298),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: Color(0xFFBFBCC1),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFAAA7AC),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF312D34),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF312D34),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    maxLength: 25,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Текст уведомления',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF969298),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Akrobat',
                                            color: Color(0xFFBFBCC1),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFAAA7AC),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF312D34),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF312D34),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    maxLength: 70,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Дата публикации',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              color: Color(0xFF969298),
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              (_model.date ?? DateTime.now()),
                                          firstDate: (getCurrentTimestamp ??
                                              DateTime(1900)),
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return wrapInMaterialDatePickerTheme(
                                              context,
                                              child!,
                                              headerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              headerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              headerTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Akrobat',
                                                        fontSize: 32.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                              pickerBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              pickerForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              selectedDateTimeBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              selectedDateTimeForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              actionButtonForegroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              iconSize: 24.0,
                                            );
                                          },
                                        );

                                        if (_datePickedDate != null) {
                                          safeSetState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                            );
                                          });
                                        } else if (_model.datePicked != null) {
                                          safeSetState(() {
                                            _model.datePicked = _model.date;
                                          });
                                        }
                                        if (_model.datePicked != null) {
                                          _model.date = _model.datePicked;
                                          _model.dispatchDate = (String? date) {
                                            return date?.split(' ').first ??
                                                '[ Выберите дату ]';
                                          }(functions.convertDateTimeToString(
                                              _model.datePicked));
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 56.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.dispatchDate,
                                                '[ Выберите дату]',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Akrobat',
                                                        color:
                                                            Color(0xFF312D34),
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Время публикации (МСК время)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              color: Color(0xFF969298),
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    if (_model.dispatchTime != null &&
                                        _model.dispatchTime != '')
                                      FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue ??=
                                              _model.dispatchTime,
                                        ),
                                        options: List<String>.from([
                                          '0:00',
                                          '1:00',
                                          '2:00',
                                          '3:00',
                                          '4:00',
                                          '5:00',
                                          '6:00',
                                          '7:00',
                                          '8:00',
                                          '9:00',
                                          '10:00',
                                          '11:00',
                                          '12:00',
                                          '13:00',
                                          '14:00',
                                          '15:00',
                                          '16:00',
                                          '17:00',
                                          '18:00',
                                          '19:00',
                                          '20:00',
                                          '21:00',
                                          '22:00',
                                          '23:00'
                                        ]),
                                        optionLabels: [
                                          '0:00',
                                          '1:00',
                                          '2:00',
                                          '3:00',
                                          '4:00',
                                          '5:00',
                                          '6:00',
                                          '7:00',
                                          '8:00',
                                          '9:00',
                                          '10:00',
                                          '11:00',
                                          '12:00',
                                          '13:00',
                                          '14:00',
                                          '15:00',
                                          '16:00',
                                          '17:00',
                                          '18:00',
                                          '19:00',
                                          '20:00',
                                          '21:00',
                                          '22:00',
                                          '23:00'
                                        ],
                                        onChanged: (val) async {
                                          safeSetState(
                                              () => _model.dropDownValue = val);
                                          _model.dispatchTime =
                                              _model.dropDownValue;
                                        },
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        hintText: 'Выберите время',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                  ].divide(SizedBox(height: 8.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          if (_model.errorList.isNotEmpty)
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: wrapWithModel(
                                model: _model.errorStackModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ErrorStackWidget(
                                  stack: _model.errorList,
                                  onClose: () async {
                                    _model.errorList = [];
                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (functions
                                  .adminNotificationPopUpValidator(
                                      _model.textController1.text,
                                      _model.textController2.text)
                                  .isNotEmpty) {
                                _model.errorList = functions
                                    .adminNotificationPopUpValidator(
                                        _model.textController1.text,
                                        _model.textController2.text)
                                    .toList()
                                    .cast<String>();
                                safeSetState(() {});
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                _model.errorList = [];
                                safeSetState(() {});
                                if (widget.doc != null) {
                                  if (widget.isDublicate) {
                                    unawaited(
                                      () async {
                                        var ffPushNotificationsQueueRecordReference1 =
                                            FfPushNotificationsQueueRecord
                                                .collection
                                                .doc();
                                        await ffPushNotificationsQueueRecordReference1
                                            .set({
                                          ...createFfPushNotificationsQueueRecordData(
                                            notificationTitle:
                                                _model.textController1.text,
                                            notificationText:
                                                _model.textController2.text,
                                            status: NotificationStatus.inQueue,
                                            isDeleted: false,
                                            dispatchTime:
                                                '${_model.dispatchDate} ${_model.dispatchTime}',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_time':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.dublicateNotificationQueueDoc =
                                            FfPushNotificationsQueueRecord
                                                .getDocumentFromData({
                                          ...createFfPushNotificationsQueueRecordData(
                                            notificationTitle:
                                                _model.textController1.text,
                                            notificationText:
                                                _model.textController2.text,
                                            status: NotificationStatus.inQueue,
                                            isDeleted: false,
                                            dispatchTime:
                                                '${_model.dispatchDate} ${_model.dispatchTime}',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'created_time': DateTime.now(),
                                            },
                                          ),
                                        }, ffPushNotificationsQueueRecordReference1);
                                      }(),
                                    );
                                    _shouldSetState = true;
                                  } else {
                                    await widget.doc!.reference.update({
                                      ...createFfPushNotificationsQueueRecordData(
                                        notificationTitle:
                                            _model.textController1.text,
                                        notificationText:
                                            _model.textController2.text,
                                        dispatchTime:
                                            '${_model.dispatchDate} ${_model.dispatchTime}',
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'modified_time':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                  }
                                } else {
                                  var ffPushNotificationsQueueRecordReference2 =
                                      FfPushNotificationsQueueRecord.collection
                                          .doc();
                                  await ffPushNotificationsQueueRecordReference2
                                      .set({
                                    ...createFfPushNotificationsQueueRecordData(
                                      notificationTitle:
                                          _model.textController1.text,
                                      notificationText:
                                          _model.textController2.text,
                                      status: NotificationStatus.inQueue,
                                      isDeleted: false,
                                      dispatchTime:
                                          '${_model.dispatchDate} ${_model.dispatchTime}',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  _model.newNotificationQueueDoc =
                                      FfPushNotificationsQueueRecord
                                          .getDocumentFromData({
                                    ...createFfPushNotificationsQueueRecordData(
                                      notificationTitle:
                                          _model.textController1.text,
                                      notificationText:
                                          _model.textController2.text,
                                      status: NotificationStatus.inQueue,
                                      isDeleted: false,
                                      dispatchTime:
                                          '${_model.dispatchDate} ${_model.dispatchTime}',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time': DateTime.now(),
                                      },
                                    ),
                                  }, ffPushNotificationsQueueRecordReference2);
                                  _shouldSetState = true;
                                }

                                Navigator.pop(context);
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'Сохранить',
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
                                    fontSize: 18.0,
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
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
