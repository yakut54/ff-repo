import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/empty_list_component/empty_list_component_widget.dart';
import '/mobile/pages/categories/notification_item/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'notifications_page_model.dart';
export 'notifications_page_model.dart';

class NotificationsPageWidget extends StatefulWidget {
  const NotificationsPageWidget({super.key});

  @override
  State<NotificationsPageWidget> createState() =>
      _NotificationsPageWidgetState();
}

class _NotificationsPageWidgetState extends State<NotificationsPageWidget> {
  late NotificationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFFFF8F7),
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Color(0xFFFFF8F7),
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.chevron_left_sharp,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
                title: Text(
                  'История уведомлений',
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
          child: AuthUserStreamWidget(
            builder: (context) => PagedListView<DocumentSnapshot<Object?>?,
                FfPushNotificationsQueueRecord>(
              pagingController: _model.setListViewController(
                FfPushNotificationsQueueRecord.collection
                    .where(
                      'timestamp',
                      isGreaterThanOrEqualTo: currentUserDocument?.createdTime,
                    )
                    .where(
                      'status',
                      isEqualTo: NotificationStatus.sent.serialize(),
                    )
                    .where(
                      'is_deleted',
                      isEqualTo: false,
                    )
                    .orderBy('timestamp', descending: true),
              ),
              padding: EdgeInsets.zero,
              reverse: false,
              scrollDirection: Axis.vertical,
              builderDelegate:
                  PagedChildBuilderDelegate<FfPushNotificationsQueueRecord>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),
                // Customize what your widget looks like when it's loading another page.
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),
                noItemsFoundIndicatorBuilder: (_) => Center(
                  child: EmptyListComponentWidget(
                    text: 'Нет уведомлений',
                  ),
                ),
                itemBuilder: (context, _, listViewIndex) {
                  final listViewFfPushNotificationsQueueRecord =
                      _model.listViewPagingController!.itemList![listViewIndex];
                  return NotificationItemWidget(
                    key: Key(
                        'Key9ku_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                    doc: listViewFfPushNotificationsQueueRecord,
                    onTap: () async {
                      var _shouldSetState = false;
                      await Future.wait([
                        Future(() async {
                          _model.aDoc = await ArticlesRecord.getDocumentOnce(
                              listViewFfPushNotificationsQueueRecord
                                  .redirect.articlesRef!);
                          _shouldSetState = true;
                        }),
                        Future(() async {
                          _model.rDoc = await RubricsRecord.getDocumentOnce(
                              listViewFfPushNotificationsQueueRecord
                                  .redirect.rubricsRef!);
                          _shouldSetState = true;
                        }),
                      ]);

                      context.pushNamed(
                        'ArticlePage',
                        queryParameters: {
                          'articlesDoc': serializeParam(
                            _model.aDoc,
                            ParamType.Document,
                          ),
                          'showCommentsOnInit': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                          'rubricDoc': serializeParam(
                            _model.rDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'articlesDoc': _model.aDoc,
                          'rubricDoc': _model.rDoc,
                        },
                      );

                      if (_shouldSetState) safeSetState(() {});
                      return;
                    
                      if (_shouldSetState) safeSetState(() {});
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
