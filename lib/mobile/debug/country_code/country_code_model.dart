import '/flutter_flow/flutter_flow_util.dart';
import 'country_code_widget.dart' show CountryCodeWidget;
import 'package:flutter/material.dart';

class CountryCodeModel extends FlutterFlowModel<CountryCodeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
