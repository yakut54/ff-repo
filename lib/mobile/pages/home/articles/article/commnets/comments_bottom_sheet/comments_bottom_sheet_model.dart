import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comments_bottom_sheet_widget.dart' show CommentsBottomSheetWidget;
import 'package:flutter/material.dart';

class CommentsBottomSheetModel
    extends FlutterFlowModel<CommentsBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  ArticlesRecord? listViewPreviousSnapshot;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
