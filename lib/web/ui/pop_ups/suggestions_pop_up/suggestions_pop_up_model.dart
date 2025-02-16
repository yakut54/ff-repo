import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/admin_upload_image_component/admin_upload_image_component_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'suggestions_pop_up_widget.dart' show SuggestionsPopUpWidget;
import 'package:flutter/material.dart';

class SuggestionsPopUpModel extends FlutterFlowModel<SuggestionsPopUpWidget> {
  ///  Local state fields for this component.

  List<String> errorList = [];
  void addToErrorList(String item) => errorList.add(item);
  void removeFromErrorList(String item) => errorList.remove(item);
  void removeAtIndexFromErrorList(int index) => errorList.removeAt(index);
  void insertAtIndexInErrorList(int index, String item) =>
      errorList.insert(index, item);
  void updateErrorListAtIndex(int index, Function(String) updateFn) =>
      errorList[index] = updateFn(errorList[index]);

  String? cover;

  bool isImageUploading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for AdminUploadImageComponent component.
  late AdminUploadImageComponentModel adminUploadImageComponentModel;
  // Stores action output result for [Custom Action - adminCreatePreviewSuggestion] action in AdminUploadImageComponent widget.
  SuggestionsRecord? doc;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for ErrorStack component.
  late ErrorStackModel errorStackModel;

  @override
  void initState(BuildContext context) {
    adminUploadImageComponentModel =
        createModel(context, () => AdminUploadImageComponentModel());
    errorStackModel = createModel(context, () => ErrorStackModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    adminUploadImageComponentModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    errorStackModel.dispose();
  }
}
