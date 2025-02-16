import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/splash/splash_content/splash_content_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'nav_bar_page_model.dart';
export 'nav_bar_page_model.dart';

class NavBarPageWidget extends StatefulWidget {
  const NavBarPageWidget({
    super.key,
    this.notification,
    this.splahList,
  });

  final DocumentReference? notification;
  final List<NewSplashsRecord>? splahList;

  @override
  State<NavBarPageWidget> createState() => _NavBarPageWidgetState();
}

class _NavBarPageWidgetState extends State<NavBarPageWidget> {
  late NavBarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().isNewSplashShow1A) {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.white,
          barrierColor: Color(0x00FFFFFF),
          enableDrag: false,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: SplashContentWidget(
                    splashDoc: FFAppState().NewSplash,
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        FFAppState().isNewSplashShow1A = true;
        safeSetState(() {});
      }
      await Future.wait([
        Future(() async {
          if (!loggedIn) {
            GoRouter.of(context).prepareAuthEvent();
            final user = await authManager.signInAnonymously(context);
            if (user == null) {
              return;
            }
            unawaited(
              () async {
                await actions.appMetricaReportWithJson(
                  'Создание гостя',
                  <String, String>{
                    'UID': currentUserReference!.id,
                  },
                );
              }(),
            );
            await Future.delayed(const Duration(milliseconds: 1000));

            await currentUserReference!.update(createUsersRecordData(
              role: Role.guest,
              isDeleted: false,
            ));
            FFAppState().anonymousId = currentUserUid;
            FFAppState().update(() {});
            return;
          } else {
            return;
          }
        }),
        Future(() async {
          if (widget.notification != null) {
            unawaited(
              () async {
                await widget.notification!.update({
                  ...mapToFirestore(
                    {
                      'clicks_counter': FieldValue.increment(1),
                    },
                  ),
                });
              }(),
            );
            _model.notificationDoc =
                await FfPushNotificationsQueueRecord.getDocumentOnce(
                    widget.notification!);
            if (_model.notificationDoc?.redirect != null) {
              await Future.wait([
                Future(() async {
                  _model.aDoc = await ArticlesRecord.getDocumentOnce(
                      _model.notificationDoc!.redirect.articlesRef!);
                }),
                Future(() async {
                  _model.rDoc = await RubricsRecord.getDocumentOnce(
                      _model.notificationDoc!.redirect.rubricsRef!);
                }),
              ]);

              context.pushNamedAuth(
                'ArticlePage',
                context.mounted,
                queryParameters: {
                  'articlesDoc': serializeParam(
                    _model.aDoc,
                    ParamType.Document,
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

              return;
            } else {
              return;
            }
          } else {
            return;
          }
        }),
        Future(() async {
          await Future.wait([
            Future(() async {
              _model.suggestionList = await querySuggestionsRecordOnce(
                queryBuilder: (suggestionsRecord) => suggestionsRecord
                    .where(
                      'is_visible',
                      isEqualTo: true,
                    )
                    .where(
                      'is_deleted',
                      isEqualTo: false,
                    )
                    .orderBy('created_time', descending: true),
              );
              await actions.getSuggesions(
                _model.suggestionList!.toList(),
              );
            }),
            Future(() async {
              _model.articleList = await queryArticlesRecordOnce(
                queryBuilder: (articlesRecord) => articlesRecord
                    .where(
                      'is_deleted',
                      isEqualTo: false,
                    )
                    .where(
                      'is_visible',
                      isEqualTo: true,
                    )
                    .where(
                      'is_published',
                      isEqualTo: true,
                    )
                    .orderBy('published_time', descending: true),
              );
              await actions.getArticles(
                _model.articleList!.toList(),
              );
            }),
            Future(() async {
              _model.rubricsList = await queryRubricsRecordOnce(
                queryBuilder: (rubricsRecord) => rubricsRecord
                    .where(
                      'is_visible',
                      isEqualTo: true,
                    )
                    .where(
                      'is_deleted',
                      isEqualTo: false,
                    )
                    .orderBy('created_time', descending: true),
              );
              await actions.getRubrics(
                _model.rubricsList!.toList(),
              );
            }),
          ]);
          await actions.setupFirestoreListeners();
        }),
      ]);
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.CustomNavBar(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
