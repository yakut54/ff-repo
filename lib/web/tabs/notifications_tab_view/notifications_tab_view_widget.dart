import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web/ui/admin_button/admin_button_widget.dart';
import '/web/ui/cards/admin_notification_card/admin_notification_card_widget.dart';
import '/web/ui/pop_ups/admin_app_pop_up/admin_app_pop_up_widget.dart';
import '/web/ui/pop_ups/notification_pop_up/notification_pop_up_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notifications_tab_view_model.dart';
export 'notifications_tab_view_model.dart';

class NotificationsTabViewWidget extends StatefulWidget {
  const NotificationsTabViewWidget({super.key});

  @override
  State<NotificationsTabViewWidget> createState() =>
      _NotificationsTabViewWidgetState();
}

class _NotificationsTabViewWidgetState
    extends State<NotificationsTabViewWidget> {
  late NotificationsTabViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsTabViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.createPushNotifications();
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
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 80.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.adminButtonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: AdminButtonWidget(
                        text: 'Предстоящие',
                        type: _model.status == NotificationStatus.inQueue
                            ? AdminButtonType.active
                            : AdminButtonType.inactive,
                        onPressed: () async {
                          _model.status = NotificationStatus.inQueue;
                          safeSetState(() {});
                        },
                      ),
                    ),
                    wrapWithModel(
                      model: _model.adminButtonModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: AdminButtonWidget(
                        text: 'Отправленные',
                        type: _model.status == NotificationStatus.sent
                            ? AdminButtonType.active
                            : AdminButtonType.inactive,
                        onPressed: () async {
                          _model.status = NotificationStatus.sent;
                          safeSetState(() {});
                        },
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: WebViewAware(
                              child: NotificationPopUpWidget(),
                            ),
                          );
                        },
                      );
                    },
                    text: 'Добавить уведомление',
                    icon: Icon(
                      Icons.add_rounded,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 50.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Akrobat',
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: StreamBuilder<List<FfPushNotificationsQueueRecord>>(
                    stream: queryFfPushNotificationsQueueRecord(
                      queryBuilder: (ffPushNotificationsQueueRecord) =>
                          ffPushNotificationsQueueRecord
                              .where(
                                'is_deleted',
                                isEqualTo: false,
                              )
                              .orderBy('created_time', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<FfPushNotificationsQueueRecord>
                          wrapFfPushNotificationsQueueRecordList =
                          snapshot.data!;

                      return Wrap(
                        spacing: 0.0,
                        runSpacing: 6.0,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(
                            wrapFfPushNotificationsQueueRecordList.length,
                            (wrapIndex) {
                          final wrapFfPushNotificationsQueueRecord =
                              wrapFfPushNotificationsQueueRecordList[wrapIndex];
                          return Visibility(
                            visible:
                                wrapFfPushNotificationsQueueRecord.status ==
                                    _model.status,
                            child: Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: AdminNotificationCardWidget(
                                  key: Key(
                                      'Keyho3_${wrapIndex}_of_${wrapFfPushNotificationsQueueRecordList.length}'),
                                  doc: wrapFfPushNotificationsQueueRecord,
                                  onEditTap: () async {
                                    if (wrapFfPushNotificationsQueueRecord
                                            .status ==
                                        NotificationStatus.inQueue) {
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
                                              child: NotificationPopUpWidget(
                                                doc:
                                                    wrapFfPushNotificationsQueueRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  onDeleteTap: () async {
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
                                            child: AdminAppPopUpWidget(
                                              text:
                                                  'Вы действительно хотите удалить уведомление?',
                                              leftBtnText: 'Отмена',
                                              rightBtnText: 'Удалить',
                                              onLBtnPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              onRBtnPressed: () async {
                                                await wrapFfPushNotificationsQueueRecord
                                                    .reference
                                                    .update(
                                                        createFfPushNotificationsQueueRecordData(
                                                  isDeleted: true,
                                                ));
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  onSendNowPressed: () async {
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
                                            child: AdminAppPopUpWidget(
                                              text:
                                                  'Отправить уведомление сейчас?',
                                              leftBtnText: 'Отправить',
                                              rightBtnText: 'Отмена',
                                              onLBtnPressed: () async {
                                                await wrapFfPushNotificationsQueueRecord
                                                    .reference
                                                    .update(
                                                        createFfPushNotificationsQueueRecordData(
                                                  status: NotificationStatus
                                                      .sending,
                                                ));
                                                Navigator.pop(context);
                                              },
                                              onRBtnPressed: () async {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  onDelLongPressed: () async {},
                                  onCopyPressed: () async {
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
                                            child: NotificationPopUpWidget(
                                              doc:
                                                  wrapFfPushNotificationsQueueRecord,
                                              isDublicate: true,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
