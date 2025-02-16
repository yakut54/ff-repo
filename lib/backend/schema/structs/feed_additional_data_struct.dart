// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FeedAdditionalDataStruct extends FFFirebaseStruct {
  FeedAdditionalDataStruct({
    FeedCardIcon? icon,
    String? title,
    String? iconImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _icon = icon,
        _title = title,
        _iconImage = iconImage,
        super(firestoreUtilData);

  // "icon" field.
  FeedCardIcon? _icon;
  FeedCardIcon? get icon => _icon;
  set icon(FeedCardIcon? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "icon_image" field.
  String? _iconImage;
  String get iconImage => _iconImage ?? '';
  set iconImage(String? val) => _iconImage = val;

  bool hasIconImage() => _iconImage != null;

  static FeedAdditionalDataStruct fromMap(Map<String, dynamic> data) =>
      FeedAdditionalDataStruct(
        icon: data['icon'] is FeedCardIcon
            ? data['icon']
            : deserializeEnum<FeedCardIcon>(data['icon']),
        title: data['title'] as String?,
        iconImage: data['icon_image'] as String?,
      );

  static FeedAdditionalDataStruct? maybeFromMap(dynamic data) => data is Map
      ? FeedAdditionalDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'icon': _icon?.serialize(),
        'title': _title,
        'icon_image': _iconImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'icon': serializeParam(
          _icon,
          ParamType.Enum,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'icon_image': serializeParam(
          _iconImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeedAdditionalDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FeedAdditionalDataStruct(
        icon: deserializeParam<FeedCardIcon>(
          data['icon'],
          ParamType.Enum,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        iconImage: deserializeParam(
          data['icon_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeedAdditionalDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeedAdditionalDataStruct &&
        icon == other.icon &&
        title == other.title &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode => const ListEquality().hash([icon, title, iconImage]);
}

FeedAdditionalDataStruct createFeedAdditionalDataStruct({
  FeedCardIcon? icon,
  String? title,
  String? iconImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedAdditionalDataStruct(
      icon: icon,
      title: title,
      iconImage: iconImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeedAdditionalDataStruct? updateFeedAdditionalDataStruct(
  FeedAdditionalDataStruct? feedAdditionalData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feedAdditionalData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeedAdditionalDataStructData(
  Map<String, dynamic> firestoreData,
  FeedAdditionalDataStruct? feedAdditionalData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feedAdditionalData == null) {
    return;
  }
  if (feedAdditionalData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feedAdditionalData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feedAdditionalDataData =
      getFeedAdditionalDataFirestoreData(feedAdditionalData, forFieldValue);
  final nestedData =
      feedAdditionalDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      feedAdditionalData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeedAdditionalDataFirestoreData(
  FeedAdditionalDataStruct? feedAdditionalData, [
  bool forFieldValue = false,
]) {
  if (feedAdditionalData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feedAdditionalData.toMap());

  // Add any Firestore field values
  feedAdditionalData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeedAdditionalDataListFirestoreData(
  List<FeedAdditionalDataStruct>? feedAdditionalDatas,
) =>
    feedAdditionalDatas
        ?.map((e) => getFeedAdditionalDataFirestoreData(e, true))
        .toList() ??
    [];
