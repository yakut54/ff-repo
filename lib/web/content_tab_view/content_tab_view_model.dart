import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/admin_button/admin_button_widget.dart';
import '/web/ui/cards/admin_story_add_card/admin_story_add_card_widget.dart';
import 'content_tab_view_widget.dart' show ContentTabViewWidget;
import 'package:flutter/material.dart';

class ContentTabViewModel extends FlutterFlowModel<ContentTabViewWidget> {
  ///  Local state fields for this component.

  int currentIndex = 0;

  String edited = 'seffsef';

  RubricsRecord? currentRubricDoc;

  ///  State fields for stateful widgets in this component.

  // Model for AdminButton component.
  late AdminButtonModel adminButtonModel1;
  // Model for AdminButton component.
  late AdminButtonModel adminButtonModel2;
  // Model for AdminButton component.
  late AdminButtonModel adminButtonModel3;
  // Stores action output result for [Bottom Sheet - ArticlePopUp] action in Button widget.
  RubricsRecord? docIfArticle;
  // Stores action output result for [Bottom Sheet - HoroscopePopUp] action in Button widget.
  RubricsRecord? docIfHoroscope;
  // Stores action output result for [Bottom Sheet - LinkPopUp] action in Button widget.
  RubricsRecord? docIfLink;
  // Stores action output result for [Bottom Sheet - ArticlePopUp] action in Button widget.
  RubricsRecord? docElse;
  // Model for AdminStoryAddCard component.
  late AdminStoryAddCardModel adminStoryAddCardModel1;
  // Model for AdminStoryAddCard component.
  late AdminStoryAddCardModel adminStoryAddCardModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Bottom Sheet - ArticlePopUp] action in AdminArticleCard widget.
  RubricsRecord? rubricDoc0;
  // Stores action output result for [Bottom Sheet - HoroscopePopUp] action in AdminArticleCard widget.
  RubricsRecord? rubricDoc1;
  // Stores action output result for [Bottom Sheet - ArticlePopUp] action in AdminArticleCard widget.
  RubricsRecord? rubricDoc3;
  // Stores action output result for [Bottom Sheet - HoroscopePopUp] action in AdminArticleCard widget.
  RubricsRecord? rubricDoc2;

  @override
  void initState(BuildContext context) {
    adminButtonModel1 = createModel(context, () => AdminButtonModel());
    adminButtonModel2 = createModel(context, () => AdminButtonModel());
    adminButtonModel3 = createModel(context, () => AdminButtonModel());
    adminStoryAddCardModel1 =
        createModel(context, () => AdminStoryAddCardModel());
    adminStoryAddCardModel2 =
        createModel(context, () => AdminStoryAddCardModel());
  }

  @override
  void dispose() {
    adminButtonModel1.dispose();
    adminButtonModel2.dispose();
    adminButtonModel3.dispose();
    adminStoryAddCardModel1.dispose();
    adminStoryAddCardModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
