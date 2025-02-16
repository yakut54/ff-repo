import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/test_folder/stories_viewer/stories_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'stories_page_model.dart';
export 'stories_page_model.dart';

class StoriesPageWidget extends StatefulWidget {
  const StoriesPageWidget({
    super.key,
    required this.stories,
    required this.initIndex,
  });

  final List<StoriesRecord>? stories;
  final int? initIndex;

  @override
  State<StoriesPageWidget> createState() => _StoriesPageWidgetState();
}

class _StoriesPageWidgetState extends State<StoriesPageWidget> {
  late StoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoriesPageModel());

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
        backgroundColor: Color(0xFF2D2830),
        appBar: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ) &&
                !isAndroid
            ? AppBar(
                backgroundColor: Color(0xFF2D2830),
                automaticallyImplyLeading: true,
                leading: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF2D2830),
            ),
            child: wrapWithModel(
              model: _model.storiesViewerModel,
              updateCallback: () => safeSetState(() {}),
              child: StoriesViewerWidget(
                initIndex: widget.initIndex,
                docs: widget.stories!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
