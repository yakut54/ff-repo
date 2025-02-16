import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web/content_tab_view/content_tab_view_widget.dart';
import '/web/tabs/notifications_tab_view/notifications_tab_view_widget.dart';
import '/web/tabs/stats_tab_view/stats_tab_view_widget.dart';
import '/web/tabs/subscriptions_tab_view/subscriptions_tab_view_widget.dart';
import '/web/ui/admin_tab_bar/admin_tab_bar_widget.dart';
import '/web/ui/pop_ups/sigh_in_pop_up/sigh_in_pop_up_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'admin_home_page_model.dart';
export 'admin_home_page_model.dart';

class AdminHomePageWidget extends StatefulWidget {
  const AdminHomePageWidget({super.key});

  @override
  State<AdminHomePageWidget> createState() => _AdminHomePageWidgetState();
}

class _AdminHomePageWidgetState extends State<AdminHomePageWidget> {
  late AdminHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminHomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentTab = AdminMenuStruct(
        adminMenuEnum: AdminMenu.contents,
        title: 'Контент',
      );
      safeSetState(() {});
      if (loggedIn) {
        _model.currentTab = AdminMenuStruct(
          adminMenuEnum: AdminMenu.contents,
          title: 'Контент',
        );
        safeSetState(() {});
        return;
      } else {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: SighInPopUpWidget(),
                ),
              ),
            );
          },
        );

        return;
      }
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
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).info,
          body: Visibility(
            visible: isWeb,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 10.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 74.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).alternate,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: Image.asset(
                                  'assets/images/app_icon.png',
                                  width: 44.0,
                                  height: 44.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (currentUserUid != '')
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'SplashScreen', context.mounted);
                                  },
                                  text: 'Выйти',
                                  icon: Icon(
                                    Icons.exit_to_app_rounded,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
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
                          ],
                        ),
                      ),
                    ),
                    if (currentUserUid != '')
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (loggedIn)
                                wrapWithModel(
                                  model: _model.adminTabBarModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AdminTabBarWidget(
                                    advancedButtonText: 'Перейти в приложение',
                                    onChanged: (adminMenuItem) async {
                                      _model.currentTab = adminMenuItem;
                                      safeSetState(() {});
                                    },
                                    onAdvancedButtonPressed: () async {
                                      context.goNamed('NavBarPage');
                                    },
                                  ),
                                ),
                              if (kDebugMode)
                                FFButtonWidget(
                                  onPressed: () async {
                                    await actions.appMetricaReportWithJson(
                                      'Test event',
                                      <String, dynamic>{
                                        'uid': currentUserReference?.id,
                                        'page': <String, dynamic>{
                                          'link':
                                              'zhensovet://marta-ng.ru${GoRouterState.of(context).uri.toString()}',
                                          'platform': 'web',
                                        },
                                      },
                                    );
                                  },
                                  text: 'Event test',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Akrobat',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                          Flexible(
                            child: Stack(
                              children: [
                                if (_model.currentTab?.adminMenuEnum ==
                                    AdminMenu.contents)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.contentTabViewModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ContentTabViewWidget(),
                                    ),
                                  ),
                                if (_model.currentTab?.adminMenuEnum ==
                                    AdminMenu.notifications)
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.notificationsTabViewModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NotificationsTabViewWidget(),
                                    ),
                                  ),
                                if (_model.currentTab?.adminMenuEnum ==
                                    AdminMenu.analitycs)
                                  wrapWithModel(
                                    model: _model.statsTabViewModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: StatsTabViewWidget(),
                                  ),
                                if (_model.currentTab?.adminMenuEnum ==
                                    AdminMenu.subscriptions)
                                  wrapWithModel(
                                    model: _model.subscriptionsTabViewModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SubscriptionsTabViewWidget(),
                                  ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                  ].divide(SizedBox(height: 40.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
