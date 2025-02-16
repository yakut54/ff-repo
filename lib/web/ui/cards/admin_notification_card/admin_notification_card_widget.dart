import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'admin_notification_card_model.dart';
export 'admin_notification_card_model.dart';

class AdminNotificationCardWidget extends StatefulWidget {
  const AdminNotificationCardWidget({
    super.key,
    required this.doc,
    this.onEditTap,
    this.onDeleteTap,
    this.onSendNowPressed,
    this.onDelLongPressed,
    this.onCopyPressed,
  });

  final FfPushNotificationsQueueRecord? doc;
  final Future Function()? onEditTap;
  final Future Function()? onDeleteTap;
  final Future Function()? onSendNowPressed;
  final Future Function()? onDelLongPressed;
  final Future Function()? onCopyPressed;

  @override
  State<AdminNotificationCardWidget> createState() =>
      _AdminNotificationCardWidgetState();
}

class _AdminNotificationCardWidgetState
    extends State<AdminNotificationCardWidget> {
  late AdminNotificationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminNotificationCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.color = widget.doc?.status == NotificationStatus.inQueue
          ? FlutterFlowTheme.of(context).primaryText
          : Color(0xFF969298);
      safeSetState(() {});
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
    return Visibility(
      visible: isWeb,
      child: Container(
        width: 308.0,
        height: 308.0,
        decoration: BoxDecoration(
          color: Color(0xFFF3F1F4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kadminMenuNotifications,
                                color: _model.color,
                                size: 24.0,
                              ),
                              if (widget.doc?.hasRedirect() ?? true)
                                Icon(
                                  Icons.article_outlined,
                                  color: _model.color,
                                  size: 24.0,
                                ),
                            ],
                          ),
                          Builder(
                            builder: (context) {
                              if (widget.doc?.status !=
                                  NotificationStatus.sent) {
                                return RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: (String dt) {
                                          return dt.replaceAll(' ', ' • ');
                                        }(widget.doc!.dispatchTime),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: _model.color,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                );
                              } else {
                                return RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: dateTimeFormat(
                                          "d.MM.yy",
                                          widget.doc!.timestamp!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              color: Color(0xFF14181B),
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      TextSpan(
                                        text: ' • ',
                                        style: TextStyle(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF14181B),
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: dateTimeFormat(
                                          "H:mm",
                                          widget.doc!.timestamp!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Akrobat',
                                          color: Color(0xFF14181B),
                                          fontSize: 14.0,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: _model.color,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                );
                              }
                            },
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!widget.doc!.hasRedirect())
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.onEditTap?.call();
                              },
                              child: Icon(
                                Icons.edit_outlined,
                                color: widget.doc?.status !=
                                        NotificationStatus.sent
                                    ? FlutterFlowTheme.of(context).primary
                                    : Color(0xFF969298),
                                size: 24.0,
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.onDeleteTap?.call();
                            },
                            onLongPress: () async {
                              await widget.onDelLongPressed?.call();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.doc!.notificationTitle,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          color: _model.color,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                  Text(
                    widget.doc!.notificationText,
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Akrobat',
                          color: _model.color,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Stack(
                children: [
                  if (widget.doc?.status == NotificationStatus.inQueue)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.onSendNowPressed?.call();
                      },
                      text: 'Отправить сейчас',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFF3F1F4),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Akrobat',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 19.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  if (widget.doc?.status == NotificationStatus.sent)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.doc?.usersCounter != null)
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Отправлено: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.doc?.usersCounter.toString(),
                                          '0',
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                ),
                              if (widget.doc?.clicksCounter != null)
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Прочитано: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Akrobat',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.doc?.clicksCounter
                                              .toString(),
                                          '0',
                                        ),
                                        style: TextStyle(),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Akrobat',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                ),
                            ],
                          ),
                        ),
                        if ((widget.doc?.status == NotificationStatus.sent) &&
                            !widget.doc!.hasRedirect())
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 10.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.content_copy,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await widget.onCopyPressed?.call();
                              },
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
