import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'test_page_model.dart';
export 'test_page_model.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({super.key});

  @override
  State<TestPageWidget> createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget> {
  late TestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPageModel());

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
        appBar: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: Color(0xFFFFF8F7),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Page Title',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Akrobat',
                        fontSize: 22.0,
                        letterSpacing: 0.0,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: FlutterFlowWebView(
                        content:
                            'https://marta-ng.com/recieve/2025/old_ny2025/',
                        bypass: false,
                        height: 589.0,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
