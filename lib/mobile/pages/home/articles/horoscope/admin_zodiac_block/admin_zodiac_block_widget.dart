import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'admin_zodiac_block_model.dart';
export 'admin_zodiac_block_model.dart';

class AdminZodiacBlockWidget extends StatefulWidget {
  const AdminZodiacBlockWidget({
    super.key,
    required this.block,
    required this.onChange,
  });

  final HoroscopeBlockStruct? block;
  final Future Function(HoroscopeBlockStruct? block)? onChange;

  @override
  State<AdminZodiacBlockWidget> createState() => _AdminZodiacBlockWidgetState();
}

class _AdminZodiacBlockWidgetState extends State<AdminZodiacBlockWidget> {
  late AdminZodiacBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminZodiacBlockModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      _model.updateBlockStruct(
        (e) => e
          ..title = _model.textController1.text
          ..forMen = _model.textController2.text
          ..forWomen = _model.textController3.text
          ..advice = _model.textController4.text
          ..zodiac = widget.block?.zodiac,
      );
      safeSetState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: widget.block?.title);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: widget.block?.forMen);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: widget.block?.forWomen);
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.block?.advice);
    _model.textFieldFocusNode4 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Text(
            functions.zodiacGetSigh(widget.block!.zodiac!),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Akrobat',
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
        ),
        TextFormField(
          controller: _model.textController1,
          focusNode: _model.textFieldFocusNode1,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController1',
            Duration(milliseconds: 10),
            () async {
              _model.updateBlockStruct(
                (e) => e..title = _model.textController1.text,
              );
              await widget.onChange?.call(
                _model.block,
              );
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            alignLabelWithHint: true,
            hintText: 'Основное',
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  fontSize: 19.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Color(0xFFF0F4F7),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Akrobat',
                fontSize: 19.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: false,
              ),
          maxLines: null,
          validator: _model.textController1Validator.asValidator(context),
        ),
        TextFormField(
          controller: _model.textController2,
          focusNode: _model.textFieldFocusNode2,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController2',
            Duration(milliseconds: 10),
            () async {
              _model.updateBlockStruct(
                (e) => e..forMen = _model.textController2.text,
              );
              await widget.onChange?.call(
                _model.block,
              );
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            alignLabelWithHint: true,
            hintText: 'Для мужчин',
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  fontSize: 19.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Color(0xFFDFE4E7),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Akrobat',
                fontSize: 19.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: false,
              ),
          maxLines: null,
          validator: _model.textController2Validator.asValidator(context),
        ),
        TextFormField(
          controller: _model.textController3,
          focusNode: _model.textFieldFocusNode3,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController3',
            Duration(milliseconds: 10),
            () async {
              _model.updateBlockStruct(
                (e) => e..forWomen = _model.textController3.text,
              );
              await widget.onChange?.call(
                _model.block,
              );
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            alignLabelWithHint: true,
            hintText: 'Для женщин',
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  fontSize: 19.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Color(0xFFF0F4F7),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Akrobat',
                fontSize: 19.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: false,
              ),
          maxLines: null,
          validator: _model.textController3Validator.asValidator(context),
        ),
        TextFormField(
          controller: _model.textController4,
          focusNode: _model.textFieldFocusNode4,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController4',
            Duration(milliseconds: 10),
            () async {
              _model.updateBlockStruct(
                (e) => e..advice = _model.textController4.text,
              );
              await widget.onChange?.call(
                _model.block,
              );
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
            alignLabelWithHint: true,
            hintText: 'Совет недели',
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Akrobat',
                  fontSize: 19.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Color(0xFFDFE4E7),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Akrobat',
                fontSize: 19.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: false,
              ),
          maxLines: null,
          validator: _model.textController4Validator.asValidator(context),
        ),
      ].divide(SizedBox(height: 10.0)),
    );
  }
}
