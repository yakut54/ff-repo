import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/ui/admin_upload_image_component/admin_upload_image_component_widget.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'category_pop_up_widget.dart' show CategoryPopUpWidget;
import 'package:flutter/material.dart';

class CategoryPopUpModel extends FlutterFlowModel<CategoryPopUpWidget> {
  ///  Local state fields for this component.

  String? image;

  bool isUploading = false;

  List<String> errorList = [];
  void addToErrorList(String item) => errorList.add(item);
  void removeFromErrorList(String item) => errorList.remove(item);
  void removeAtIndexFromErrorList(int index) => errorList.removeAt(index);
  void insertAtIndexInErrorList(int index, String item) =>
      errorList.insert(index, item);
  void updateErrorListAtIndex(int index, Function(String) updateFn) =>
      errorList[index] = updateFn(errorList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - adminCreateCategoryRecord] action in IconButton widget.
  CategoriesRecord? currentDoc;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for AdminUploadImageComponent component.
  late AdminUploadImageComponentModel adminUploadImageComponentModel;
  // Stores action output result for [Custom Action - adminCreatePreviewCategoryRecord] action in AdminUploadImageComponent widget.
  CategoriesRecord? categoryDoc;
  // State field(s) for Switch widget.
  bool? switchValue;
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

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    adminUploadImageComponentModel.dispose();
    errorStackModel.dispose();
  }
}
