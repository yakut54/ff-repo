import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'admin_button_model.dart';
export 'admin_button_model.dart';

class AdminButtonWidget extends StatefulWidget {
  const AdminButtonWidget({
    super.key,
    required this.text,
    required this.type,
    this.onPressed,
  });

  final String? text;
  final AdminButtonType? type;
  final Future Function()? onPressed;

  @override
  State<AdminButtonWidget> createState() => _AdminButtonWidgetState();
}

class _AdminButtonWidgetState extends State<AdminButtonWidget> {
  late AdminButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.onPressed?.call();
      },
      text: widget.text!,
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Color(0xFFF3F1F4),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Akrobat',
              color: widget.type == AdminButtonType.active
                  ? FlutterFlowTheme.of(context).primary
                  : Color(0xFF2D2830),
              letterSpacing: 0.0,
              fontWeight: FontWeight.w600,
              useGoogleFonts: false,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
