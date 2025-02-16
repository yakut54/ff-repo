import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/articles/article/article_block_viewer/article_block_viewer_widget.dart';
import 'package:flutter/material.dart';
import 'admin_article_preview_model.dart';
export 'admin_article_preview_model.dart';

class AdminArticlePreviewWidget extends StatefulWidget {
  const AdminArticlePreviewWidget({
    super.key,
    required this.list,
  });

  final List<ArticleBlockStruct>? list;

  @override
  State<AdminArticlePreviewWidget> createState() =>
      _AdminArticlePreviewWidgetState();
}

class _AdminArticlePreviewWidgetState extends State<AdminArticlePreviewWidget> {
  late AdminArticlePreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminArticlePreviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 432.0,
        height: 800.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Color(0xFF12093A),
            width: 16.0,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.articleBlockViewerModel,
                updateCallback: () => safeSetState(() {}),
                child: ArticleBlockViewerWidget(
                  articleBlockList: widget.list,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
