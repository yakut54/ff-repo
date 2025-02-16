import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/admin_upload_image_component/admin_upload_image_component_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'story_pop_up_widget.dart' show StoryPopUpWidget;
import 'package:flutter/material.dart';

class StoryPopUpModel extends FlutterFlowModel<StoryPopUpWidget> {
  ///  Local state fields for this component.

  String? image;

  bool imageIsUploading = false;

  List<String> errorList = [];
  void addToErrorList(String item) => errorList.add(item);
  void removeFromErrorList(String item) => errorList.remove(item);
  void removeAtIndexFromErrorList(int index) => errorList.removeAt(index);
  void insertAtIndexInErrorList(int index, String item) =>
      errorList.insert(index, item);
  void updateErrorListAtIndex(int index, Function(String) updateFn) =>
      errorList[index] = updateFn(errorList[index]);

  String? cover;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for AdminUploadImageComponent component.
  late AdminUploadImageComponentModel adminUploadImageComponentModel1;
  // Stores action output result for [Custom Action - adminCreatePreviewStoryList] action in AdminUploadImageComponent widget.
  List<StoriesRecord>? storyDoc2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for AdminUploadImageComponent component.
  late AdminUploadImageComponentModel adminUploadImageComponentModel2;
  // Stores action output result for [Custom Action - adminCreatePreviewStoryList] action in AdminUploadImageComponent widget.
  List<StoriesRecord>? storyDoc1;
  // Model for ErrorStack component.
  late ErrorStackModel errorStackModel;

  @override
  void initState(BuildContext context) {
    adminUploadImageComponentModel1 =
        createModel(context, () => AdminUploadImageComponentModel());
    adminUploadImageComponentModel2 =
        createModel(context, () => AdminUploadImageComponentModel());
    errorStackModel = createModel(context, () => ErrorStackModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    adminUploadImageComponentModel1.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    adminUploadImageComponentModel2.dispose();
    errorStackModel.dispose();
  }
}
