import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'splash_screen_auth_model.dart';
export 'splash_screen_auth_model.dart';

class SplashScreenAuthWidget extends StatefulWidget {
  const SplashScreenAuthWidget({
    super.key,
    this.notification,
    this.notifDoc,
  });

  final DocumentReference? notification;
  final FfPushNotificationsQueueRecord? notifDoc;

  @override
  State<SplashScreenAuthWidget> createState() => _SplashScreenAuthWidgetState();
}

class _SplashScreenAuthWidgetState extends State<SplashScreenAuthWidget> {
  late SplashScreenAuthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenAuthModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isWeb) {
        context.goNamed(
          'AdminHomePage',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 1000));
        _model.splashList = await queryNewSplashsRecordOnce(
          queryBuilder: (newSplashsRecord) => newSplashsRecord
              .where(
                'is_deleted',
                isEqualTo: false,
              )
              .where(
                'is_visible',
                isEqualTo: true,
              )
              .orderBy('create_date', descending: true),
        );
        await actions.getRandomSplashItem(
          _model.splashList?.toList(),
        );

        context.goNamed(
          'NavBarPage',
          queryParameters: {
            'notification': serializeParam(
              widget.notification,
              ParamType.DocumentReference,
            ),
            'splahList': serializeParam(
              _model.splashList,
              ParamType.Document,
              isList: true,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'splahList': _model.splashList,
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 220),
              curve: Curves.elasticOut,
              width: MediaQuery.sizeOf(context).width * 0.5,
              decoration: BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/app_icon.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
