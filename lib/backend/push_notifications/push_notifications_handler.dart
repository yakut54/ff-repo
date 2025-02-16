import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              child: Center(
                child: Image.asset(
                  'assets/images/app_icon.png',
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  fit: BoxFit.contain,
                ),
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'FeedPageOld': ParameterData.none(),
  'AdminHomePage': ParameterData.none(),
  'SplashScreen': ParameterData.none(),
  'NavBarPage': (data) async => ParameterData(
        allParams: {
          'notification': getParameter<DocumentReference>(data, 'notification'),
        },
      ),
  'CategoriesPage': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'SighInPage': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'CodeVerifyPage': ParameterData.none(),
  'SplashScreenAuth': (data) async => ParameterData(
        allParams: {
          'notification': getParameter<DocumentReference>(data, 'notification'),
          'notifDoc':
              await getDocumentParameter<FfPushNotificationsQueueRecord>(data,
                  'notifDoc', FfPushNotificationsQueueRecord.fromSnapshot),
        },
      ),
  'ArticlePage': (data) async => ParameterData(
        allParams: {
          'articlesDoc': await getDocumentParameter<ArticlesRecord>(
              data, 'articlesDoc', ArticlesRecord.fromSnapshot),
          'showCommentsOnInit': getParameter<bool>(data, 'showCommentsOnInit'),
          'rubricDoc': await getDocumentParameter<RubricsRecord>(
              data, 'rubricDoc', RubricsRecord.fromSnapshot),
        },
      ),
  'StoriesPage': (data) async => ParameterData(
        allParams: {
          'initIndex': getParameter<int>(data, 'initIndex'),
        },
      ),
  'UserNamePage': (data) async => ParameterData(
        allParams: {
          'canPop': getParameter<bool>(data, 'canPop'),
        },
      ),
  'NotificationsPage': ParameterData.none(),
  'UserDataPage': ParameterData.none(),
  'AboutAppPage': ParameterData.none(),
  'ChangePhoneCodeVerifyPage': ParameterData.none(),
  'ChangePhonePage': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
        },
      ),
  'SubscriptionsPage': (data) async => ParameterData(
        allParams: {},
      ),
  'ConnectionInfo': ParameterData.none(),
  'DebugPage': ParameterData.none(),
  'PrivacyPolicyPage': ParameterData.none(),
  'TermsPage': ParameterData.none(),
  'YTPlayer': ParameterData.none(),
  'FeedPage': ParameterData.none(),
  'CountryCode': ParameterData.none(),
  'TestPage': ParameterData.none(),
  'NewsFeedPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
