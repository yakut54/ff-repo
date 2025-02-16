import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sigh_in_pop_up_widget.dart' show SighInPopUpWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SighInPopUpModel extends FlutterFlowModel<SighInPopUpWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '###-###-##-##');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (smsc)] action in TextField widget.
  ApiCallResponse? apiResult3a8;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? doc;
  // Stores action output result for [Backend Call - API (smsc)] action in Button widget.
  ApiCallResponse? apiResult3a8ddssdsd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
