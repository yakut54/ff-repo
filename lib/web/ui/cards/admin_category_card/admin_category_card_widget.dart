import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'admin_category_card_model.dart';
export 'admin_category_card_model.dart';

class AdminCategoryCardWidget extends StatefulWidget {
  const AdminCategoryCardWidget({
    super.key,
    required this.doc,
    this.onEditPressed,
    this.onDeletePressed,
    this.onVisabilityPressed,
    this.onVisabilityLongPressed,
    this.onDelLongPressed,
  });

  final CategoriesRecord? doc;
  final Future Function()? onEditPressed;
  final Future Function()? onDeletePressed;
  final Future Function()? onVisabilityPressed;
  final Future Function()? onVisabilityLongPressed;
  final Future Function()? onDelLongPressed;

  @override
  State<AdminCategoryCardWidget> createState() =>
      _AdminCategoryCardWidgetState();
}

class _AdminCategoryCardWidgetState extends State<AdminCategoryCardWidget> {
  late AdminCategoryCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCategoryCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isWeb,
      child: Container(
        width: 308.0,
        height: 136.0,
        decoration: BoxDecoration(
          color: widget.doc!.isVisible ? Color(0xFFF3F1F4) : Color(0x7FF3F1F4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: Text(
                        widget.doc!.name,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Akrobat',
                              color: widget.doc!.isVisible
                                  ? Color(0xFF14181B)
                                  : Color(0xFF969298),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Visibility(
                      visible: widget.doc?.isPaid ?? true,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        child: Text(
                          '₽',
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Akrobat',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!widget.doc!.isUndeletable)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.onDeletePressed?.call();
                          },
                          onLongPress: () async {
                            await widget.onDelLongPressed?.call();
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                        ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.onVisabilityPressed?.call();
                        },
                        onLongPress: () async {
                          await widget.onVisabilityLongPressed?.call();
                        },
                        child: Icon(
                          Icons.visibility_sharp,
                          color: widget.doc!.isVisible
                              ? FlutterFlowTheme.of(context).primary
                              : Color(0xFF312D34),
                          size: 24.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.onEditPressed?.call();
                        },
                        child: Icon(
                          Icons.edit_outlined,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
