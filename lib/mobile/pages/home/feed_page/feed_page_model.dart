import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/ui/no_internet/no_internet_widget.dart';
import 'feed_page_widget.dart' show FeedPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedPageModel extends FlutterFlowModel<FeedPageWidget> {
  ///  Local state fields for this page.

  PageState? pageState = PageState.initial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - canLoad] action in FeedPage widget.
  bool? canLoad;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ArticlesRecord>? listViewPagingController;
  Query? listViewPagingQuery;

  // Stores action output result for [Backend Call - Read Document] action in FeedCard widget.
  RubricsRecord? rDoc0;
  // Stores action output result for [Backend Call - Read Document] action in FeedCard widget.
  RubricsRecord? rDoc1;
  // Model for NoInternet component.
  late NoInternetModel noInternetModel;
  // Stores action output result for [Action Block - canLoad] action in NoInternet widget.
  bool? canLoadOnRefresh;

  @override
  void initState(BuildContext context) {
    noInternetModel = createModel(context, () => NoInternetModel());
  }

  @override
  void dispose() {
    listViewPagingController?.dispose();

    noInternetModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, ArticlesRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ArticlesRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ArticlesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryArticlesRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 25,
          isStream: false,
        ),
      );
  }
}
