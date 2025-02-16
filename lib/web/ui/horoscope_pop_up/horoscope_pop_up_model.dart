import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'horoscope_pop_up_widget.dart' show HoroscopePopUpWidget;
import 'package:flutter/material.dart';

class HoroscopePopUpModel extends FlutterFlowModel<HoroscopePopUpWidget> {
  ///  Local state fields for this component.

  List<HoroscopeBlockStruct> list = [];
  void addToList(HoroscopeBlockStruct item) => list.add(item);
  void removeFromList(HoroscopeBlockStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, HoroscopeBlockStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(HoroscopeBlockStruct) updateFn) =>
      list[index] = updateFn(list[index]);

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Model for ErrorStack component.
  late ErrorStackModel errorStackModel;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ArticlesRecord? newArticleDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  RubricsRecord? returnRubricDoc;

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

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    errorStackModel.dispose();
  }
}
