import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'subscription_pop_up_widget.dart' show SubscriptionPopUpWidget;
import 'package:flutter/material.dart';

class SubscriptionPopUpModel extends FlutterFlowModel<SubscriptionPopUpWidget> {
  ///  Local state fields for this component.

  List<String> errorList = [];
  void addToErrorList(String item) => errorList.add(item);
  void removeFromErrorList(String item) => errorList.remove(item);
  void removeAtIndexFromErrorList(int index) => errorList.removeAt(index);
  void insertAtIndexInErrorList(int index, String item) =>
      errorList.insert(index, item);
  void updateErrorListAtIndex(int index, Function(String) updateFn) =>
      errorList[index] = updateFn(errorList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for ErrorStack component.
  late ErrorStackModel errorStackModel;

  @override
  void initState(BuildContext context) {
    errorStackModel = createModel(context, () => ErrorStackModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    errorStackModel.dispose();
  }
}
