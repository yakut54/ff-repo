import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/ui/previews/admin_article_block/admin_article_block_widget.dart';
import 'admin_article_block_builder_widget.dart'
    show AdminArticleBlockBuilderWidget;
import 'package:flutter/material.dart';

class AdminArticleBlockBuilderModel
    extends FlutterFlowModel<AdminArticleBlockBuilderWidget> {
  ///  Local state fields for this component.

  List<ArticleBlockStruct> list = [];
  void addToList(ArticleBlockStruct item) => list.add(item);
  void removeFromList(ArticleBlockStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, ArticleBlockStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(ArticleBlockStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - reorderArticleBlockItems] action in ListView widget.
  List<ArticleBlockStruct>? reorderedList;
  // Models for AdminArticleBlock dynamic component.
  late FlutterFlowDynamicModels<AdminArticleBlockModel> adminArticleBlockModels;
  // Stores action output result for [Bottom Sheet - ArticleBlockAdd] action in Button widget.
  ArticleBlockStruct? articleBlock;

  @override
  void initState(BuildContext context) {
    adminArticleBlockModels =
        FlutterFlowDynamicModels(() => AdminArticleBlockModel());
  }

  @override
  void dispose() {
    adminArticleBlockModels.dispose();
  }
}
