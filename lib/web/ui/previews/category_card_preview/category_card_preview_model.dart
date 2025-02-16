import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/categories/category_card/category_card_widget.dart';
import 'category_card_preview_widget.dart' show CategoryCardPreviewWidget;
import 'package:flutter/material.dart';

class CategoryCardPreviewModel
    extends FlutterFlowModel<CategoryCardPreviewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel1;
  // Model for CategoryCard component.
  late CategoryCardModel categoryCardModel2;

  @override
  void initState(BuildContext context) {
    categoryCardModel1 = createModel(context, () => CategoryCardModel());
    categoryCardModel2 = createModel(context, () => CategoryCardModel());
  }

  @override
  void dispose() {
    categoryCardModel1.dispose();
    categoryCardModel2.dispose();
  }
}
