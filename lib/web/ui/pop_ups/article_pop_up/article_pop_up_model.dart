import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/ui/pop_ups/error_stack/error_stack_widget.dart';
import 'article_pop_up_widget.dart' show ArticlePopUpWidget;
import 'package:flutter/material.dart';

class ArticlePopUpModel extends FlutterFlowModel<ArticlePopUpWidget> {
  ///  Local state fields for this component.

  List<ArticleBlockStruct> list = [];
  void addToList(ArticleBlockStruct item) => list.add(item);
  void removeFromList(ArticleBlockStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, ArticleBlockStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(ArticleBlockStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  List<String> errorList = [];
  void addToErrorList(String item) => errorList.add(item);
  void removeFromErrorList(String item) => errorList.remove(item);
  void removeAtIndexFromErrorList(int index) => errorList.removeAt(index);
  void insertAtIndexInErrorList(int index, String item) =>
      errorList.insert(index, item);
  void updateErrorListAtIndex(int index, Function(String) updateFn) =>
      errorList[index] = updateFn(errorList[index]);

  String? startDate = '';

  String? startTime = '';

  String? endDate;

  String? endTime;

  DateTime? startDT;

  DateTime? endDT;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Switch widget.
  bool? switchValue2;
  DateTime? datePicked1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for Switch widget.
  bool? switchValue3;
  DateTime? datePicked2;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Model for ErrorStack component.
  late ErrorStackModel errorStackModel;
  // Stores action output result for [Bottom Sheet - ArticleBlockAdd] action in Button widget.
  ArticleBlockStruct? articleBlock;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ArticlesRecord? newArticleDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FfPushNotificationsQueueRecord? notificationDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  RubricsRecord? returnRubricDoc;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    columnController = ScrollController();
    errorStackModel = createModel(context, () => ErrorStackModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    listViewController?.dispose();
    columnController?.dispose();
    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    errorStackModel.dispose();
  }
}
