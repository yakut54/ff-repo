import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/ui/new_feed_card/new_feed_card_widget.dart';
import '/mobile/ui/preloader/preloader_widget.dart';
import 'news_feed_page_widget.dart' show NewsFeedPageWidget;
import 'package:flutter/material.dart';

class NewsFeedPageModel extends FlutterFlowModel<NewsFeedPageWidget> {
  ///  Local state fields for this page.

  PageState? pageState = PageState.initial;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - canLoad] action in NewsFeedPage widget.
  bool? isCanLoad;
  // Model for Preloader component.
  late PreloaderModel preloaderModel;
  // Models for NewFeedCard dynamic component.
  late FlutterFlowDynamicModels<NewFeedCardModel> newFeedCardModels;

  @override
  void initState(BuildContext context) {
    preloaderModel = createModel(context, () => PreloaderModel());
    newFeedCardModels = FlutterFlowDynamicModels(() => NewFeedCardModel());
  }

  @override
  void dispose() {
    preloaderModel.dispose();
    newFeedCardModels.dispose();
  }
}
