import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile/pages/profile/profile_data/profile_item/profile_item_widget.dart';
import '/mobile/pages/profile/subscription/subscriptions_container/subscriptions_container_widget.dart';
import '/mobile/ui/mobile_pop_up/mobile_pop_up_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await action_blocks.updateOnlineStatus(context);
        }(),
      );
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
        backgroundColor: Color(0xFFFFF8F7),
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Color(0xFFFFF8F7),
                automaticallyImplyLeading: false,
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Visibility(
                            visible: currentUserDocument?.role == Role.guest
                                ? false
                                : (FFAppState().hasInternet &&
                                    !FFAppState().hasVPN &&
                                    functions.isFriendlyCountry(
                                        FFAppState().countryCode) &&
                                    FFAppState().sub),
                            child: AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model.subscriptionsContainerModel,
                                updateCallback: () => safeSetState(() {}),
                                child: SubscriptionsContainerWidget(
                                  title: 'Подписки',
                                  subtitle: 'Подписки',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (currentUserDocument?.role == Role.developer)
                        AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.profileItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: ProfileItemWidget(
                              icon: Icon(
                                Icons.code_rounded,
                              ),
                              text: 'Debug',
                              onPressed: () async {
                                context.pushNamed('DebugPage');
                              },
                            ),
                          ),
                        ),
                      if (currentUserDocument?.role != Role.guest)
                        AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.profileItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: ProfileItemWidget(
                              icon: Icon(
                                FFIcons.kpersonalData,
                              ),
                              text: 'Личные данные',
                              onPressed: () async {
                                context.pushNamed('UserDataPage');
                              },
                            ),
                          ),
                        ),
                      wrapWithModel(
                        model: _model.profileItemModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ProfileItemWidget(
                          icon: Icon(
                            FFIcons.knotificationsHistory,
                          ),
                          text: 'История уведомлений',
                          onPressed: () async {
                            context.pushNamed('NotificationsPage');
                          },
                        ),
                      ),
                      if (!isWeb)
                        wrapWithModel(
                          model: _model.profileItemModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: ProfileItemWidget(
                            icon: Icon(
                              FFIcons.knotificationsSetting,
                            ),
                            text: 'Настройка уведомлений',
                            onPressed: () async {
                              await actions.openAppSettings();
                            },
                          ),
                        ),
                      if (currentUserDocument?.role == Role.guest
                          ? false
                          : (FFAppState().hasInternet &&
                              !FFAppState().hasVPN &&
                              functions.isFriendlyCountry(
                                  FFAppState().countryCode) &&
                              FFAppState().sub))
                        AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.profileItemModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: ProfileItemWidget(
                              icon: Icon(
                                FFIcons.ksubscription,
                              ),
                              text: 'Подписка',
                              onPressed: () async {
                                await Future.wait([
                                  Future(() async {
                                    _model.paidCategories =
                                        await queryCategoriesRecordOnce(
                                      queryBuilder: (categoriesRecord) =>
                                          categoriesRecord
                                              .where(
                                                'is_paid',
                                                isEqualTo: true,
                                              )
                                              .where(
                                                'is_visible',
                                                isEqualTo: true,
                                              )
                                              .where(
                                                'is_deleted',
                                                isEqualTo: false,
                                              ),
                                    );
                                  }),
                                  Future(() async {
                                    _model.subscriptionTiers =
                                        await querySubscriptionTiersRecordOnce(
                                      queryBuilder: (subscriptionTiersRecord) =>
                                          subscriptionTiersRecord.orderBy(
                                              'created_time',
                                              descending: true),
                                    );
                                  }),
                                ]);

                                context.pushNamed(
                                  'SubscriptionsPage',
                                  queryParameters: {
                                    'paidCategories': serializeParam(
                                      _model.paidCategories,
                                      ParamType.Document,
                                      isList: true,
                                    ),
                                    'subscriptionTiers': serializeParam(
                                      _model.subscriptionTiers,
                                      ParamType.Document,
                                      isList: true,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'paidCategories': _model.paidCategories,
                                    'subscriptionTiers':
                                        _model.subscriptionTiers,
                                  },
                                );

                                safeSetState(() {});
                              },
                            ),
                          ),
                        ),
                      wrapWithModel(
                        model: _model.profileItemModel6,
                        updateCallback: () => safeSetState(() {}),
                        child: ProfileItemWidget(
                          icon: Icon(
                            FFIcons.ksupport,
                          ),
                          text: 'Техподдержка',
                          onPressed: () async {
                            await launchURL('https://t.me/zhensovet_techbot');
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.profileItemModel7,
                        updateCallback: () => safeSetState(() {}),
                        child: ProfileItemWidget(
                          icon: Icon(
                            FFIcons.kaboutApp,
                          ),
                          text: 'О приложении',
                          onPressed: () async {
                            context.pushNamed('AboutAppPage');
                          },
                        ),
                      ),
                      if (currentUserDocument?.role != Role.guest)
                        AuthUserStreamWidget(
                          builder: (context) => wrapWithModel(
                            model: _model.profileItemModel8,
                            updateCallback: () => safeSetState(() {}),
                            child: ProfileItemWidget(
                              icon: Icon(
                                FFIcons.ksighOut,
                              ),
                              text: 'Выйти',
                              onPressed: () async {
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
                                          child: MobilePopUpWidget(
                                            text:
                                                'Вы уверены, что хотите выйти? из аккаунта?',
                                            leftBtnText: 'Да, уверен',
                                            rightBtnText: 'Отмена',
                                            leftBtnAction: () async {
                                              await actions.logout(
                                                context,
                                              );
                                              Navigator.pop(context);
                                            },
                                            rightBtnAction: () async {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (currentUserDocument?.role == Role.guest)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('SighInPage');
                        },
                        text: 'Войти',
                        options: FFButtonOptions(
                          width: 326.0,
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
