import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/ui/no_internet/no_internet_widget.dart';
import 'categories_page_widget.dart' show CategoriesPageWidget;
import 'package:flutter/material.dart';

class CategoriesPageModel extends FlutterFlowModel<CategoriesPageWidget> {
  ///  Local state fields for this page.

  List<CategoriesRecord> categoriesDocs = [];
  void addToCategoriesDocs(CategoriesRecord item) => categoriesDocs.add(item);
  void removeFromCategoriesDocs(CategoriesRecord item) =>
      categoriesDocs.remove(item);
  void removeAtIndexFromCategoriesDocs(int index) =>
      categoriesDocs.removeAt(index);
  void insertAtIndexInCategoriesDocs(int index, CategoriesRecord item) =>
      categoriesDocs.insert(index, item);
  void updateCategoriesDocsAtIndex(
          int index, Function(CategoriesRecord) updateFn) =>
      categoriesDocs[index] = updateFn(categoriesDocs[index]);

  PageState? pageState = PageState.initial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - canLoad] action in CategoriesPage widget.
  bool? canLoadInit;
  // Stores action output result for [Firestore Query - Query a collection] action in CategoriesPage widget.
  List<CategoriesRecord>? docs;
  // Stores action output result for [Firestore Query - Query a collection] action in CategoryCard widget.
  List<CategoriesRecord>? paidCategories;
  // Stores action output result for [Firestore Query - Query a collection] action in CategoryCard widget.
  List<SubscriptionTiersRecord>? subscriptionTiers;
  // Model for NoInternet component.
  late NoInternetModel noInternetModel;
  // Stores action output result for [Action Block - canLoad] action in NoInternet widget.
  bool? canLoadOnRefresh;
  // Stores action output result for [Firestore Query - Query a collection] action in NoInternet widget.
  List<CategoriesRecord>? docsOnRefresh;

  @override
  void initState(BuildContext context) {
    noInternetModel = createModel(context, () => NoInternetModel());
  }

  @override
  void dispose() {
    noInternetModel.dispose();
  }
}
