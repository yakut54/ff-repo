import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/profile/profile_data/profile_item/profile_item_widget.dart';
import '/mobile/pages/profile/subscription/subscriptions_container/subscriptions_container_widget.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SubscriptionsContainer component.
  late SubscriptionsContainerModel subscriptionsContainerModel;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel1;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel2;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel3;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel4;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel5;
  // Stores action output result for [Firestore Query - Query a collection] action in ProfileItem widget.
  List<CategoriesRecord>? paidCategories;
  // Stores action output result for [Firestore Query - Query a collection] action in ProfileItem widget.
  List<SubscriptionTiersRecord>? subscriptionTiers;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel6;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel7;
  // Model for ProfileItem component.
  late ProfileItemModel profileItemModel8;

  @override
  void initState(BuildContext context) {
    subscriptionsContainerModel =
        createModel(context, () => SubscriptionsContainerModel());
    profileItemModel1 = createModel(context, () => ProfileItemModel());
    profileItemModel2 = createModel(context, () => ProfileItemModel());
    profileItemModel3 = createModel(context, () => ProfileItemModel());
    profileItemModel4 = createModel(context, () => ProfileItemModel());
    profileItemModel5 = createModel(context, () => ProfileItemModel());
    profileItemModel6 = createModel(context, () => ProfileItemModel());
    profileItemModel7 = createModel(context, () => ProfileItemModel());
    profileItemModel8 = createModel(context, () => ProfileItemModel());
  }

  @override
  void dispose() {
    subscriptionsContainerModel.dispose();
    profileItemModel1.dispose();
    profileItemModel2.dispose();
    profileItemModel3.dispose();
    profileItemModel4.dispose();
    profileItemModel5.dispose();
    profileItemModel6.dispose();
    profileItemModel7.dispose();
    profileItemModel8.dispose();
  }
}
