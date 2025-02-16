import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'admin_story_add_card_model.dart';
export 'admin_story_add_card_model.dart';

class AdminStoryAddCardWidget extends StatefulWidget {
  const AdminStoryAddCardWidget({
    super.key,
    this.onPressed,
  });

  final Future Function()? onPressed;

  @override
  State<AdminStoryAddCardWidget> createState() =>
      _AdminStoryAddCardWidgetState();
}

class _AdminStoryAddCardWidgetState extends State<AdminStoryAddCardWidget> {
  late AdminStoryAddCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminStoryAddCardModel());

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
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await widget.onPressed?.call();
        },
        child: Container(
          width: 146.0,
          height: 146.0,
          decoration: BoxDecoration(
            color: Color(0xFFF3F1F4),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  'Добавить историю',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Akrobat',
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Icon(
                Icons.add_sharp,
                color: FlutterFlowTheme.of(context).primary,
                size: 40.0,
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
