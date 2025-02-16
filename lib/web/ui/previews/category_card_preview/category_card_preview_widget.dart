import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile/pages/categories/category_card/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'category_card_preview_model.dart';
export 'category_card_preview_model.dart';

class CategoryCardPreviewWidget extends StatefulWidget {
  const CategoryCardPreviewWidget({
    super.key,
    required this.doc,
  });

  final CategoriesRecord? doc;

  @override
  State<CategoryCardPreviewWidget> createState() =>
      _CategoryCardPreviewWidgetState();
}

class _CategoryCardPreviewWidgetState extends State<CategoryCardPreviewWidget> {
  late CategoryCardPreviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryCardPreviewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.categoryCardModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: CategoryCardWidget(
                      type: CategoryCardType.short,
                      doc: widget.doc!,
                      onTap: () async {},
                    ),
                  ),
                  wrapWithModel(
                    model: _model.categoryCardModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: CategoryCardWidget(
                      type: CategoryCardType.long,
                      doc: widget.doc!,
                      onTap: () async {},
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 10.0))
                    .addToStart(SizedBox(height: 20.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
              FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Закрыть',
                icon: Icon(
                  Icons.close_rounded,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Akrobat',
                        color: Colors.white,
                        letterSpacing: 0.0,
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
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
