// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RubricsStateTypeStruct extends FFFirebaseStruct {
  RubricsStateTypeStruct({
    String? id,
    String? name,
    List<String>? articlesDocs,
    bool? isVisible,
    bool? isDeleted,
    DateTime? createdTime,
    DateTime? modifiedTime,
    FeedCardIcon? icon,
    Editor? editor,
    String? banner,
    String? iconImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _articlesDocs = articlesDocs,
        _isVisible = isVisible,
        _isDeleted = isDeleted,
        _createdTime = createdTime,
        _modifiedTime = modifiedTime,
        _icon = icon,
        _editor = editor,
        _banner = banner,
        _iconImage = iconImage,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "articles_docs" field.
  List<String>? _articlesDocs;
  List<String> get articlesDocs => _articlesDocs ?? const [];
  set articlesDocs(List<String>? val) => _articlesDocs = val;

  void updateArticlesDocs(Function(List<String>) updateFn) {
    updateFn(_articlesDocs ??= []);
  }

  bool hasArticlesDocs() => _articlesDocs != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  set modifiedTime(DateTime? val) => _modifiedTime = val;

  bool hasModifiedTime() => _modifiedTime != null;

  // "icon" field.
  FeedCardIcon? _icon;
  FeedCardIcon? get icon => _icon;
  set icon(FeedCardIcon? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "editor" field.
  Editor? _editor;
  Editor? get editor => _editor;
  set editor(Editor? val) => _editor = val;

  bool hasEditor() => _editor != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  set banner(String? val) => _banner = val;

  bool hasBanner() => _banner != null;

  // "icon_image" field.
  String? _iconImage;
  String get iconImage => _iconImage ?? '';
  set iconImage(String? val) => _iconImage = val;

  bool hasIconImage() => _iconImage != null;

  static RubricsStateTypeStruct fromMap(Map<String, dynamic> data) =>
      RubricsStateTypeStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        articlesDocs: getDataList(data['articles_docs']),
        isVisible: data['is_visible'] as bool?,
        isDeleted: data['is_deleted'] as bool?,
        createdTime: data['created_time'] as DateTime?,
        modifiedTime: data['modified_time'] as DateTime?,
        icon: data['icon'] is FeedCardIcon
            ? data['icon']
            : deserializeEnum<FeedCardIcon>(data['icon']),
        editor: data['editor'] is Editor
            ? data['editor']
            : deserializeEnum<Editor>(data['editor']),
        banner: data['banner'] as String?,
        iconImage: data['icon_image'] as String?,
      );

  static RubricsStateTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? RubricsStateTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'articles_docs': _articlesDocs,
        'is_visible': _isVisible,
        'is_deleted': _isDeleted,
        'created_time': _createdTime,
        'modified_time': _modifiedTime,
        'icon': _icon?.serialize(),
        'editor': _editor?.serialize(),
        'banner': _banner,
        'icon_image': _iconImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'articles_docs': serializeParam(
          _articlesDocs,
          ParamType.String,
          isList: true,
        ),
        'is_visible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'modified_time': serializeParam(
          _modifiedTime,
          ParamType.DateTime,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.Enum,
        ),
        'editor': serializeParam(
          _editor,
          ParamType.Enum,
        ),
        'banner': serializeParam(
          _banner,
          ParamType.String,
        ),
        'icon_image': serializeParam(
          _iconImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static RubricsStateTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RubricsStateTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        articlesDocs: deserializeParam<String>(
          data['articles_docs'],
          ParamType.String,
          true,
        ),
        isVisible: deserializeParam(
          data['is_visible'],
          ParamType.bool,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.bool,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        modifiedTime: deserializeParam(
          data['modified_time'],
          ParamType.DateTime,
          false,
        ),
        icon: deserializeParam<FeedCardIcon>(
          data['icon'],
          ParamType.Enum,
          false,
        ),
        editor: deserializeParam<Editor>(
          data['editor'],
          ParamType.Enum,
          false,
        ),
        banner: deserializeParam(
          data['banner'],
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
  String toString() => 'RubricsStateTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RubricsStateTypeStruct &&
        id == other.id &&
        name == other.name &&
        listEquality.equals(articlesDocs, other.articlesDocs) &&
        isVisible == other.isVisible &&
        isDeleted == other.isDeleted &&
        createdTime == other.createdTime &&
        modifiedTime == other.modifiedTime &&
        icon == other.icon &&
        editor == other.editor &&
        banner == other.banner &&
        iconImage == other.iconImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        articlesDocs,
        isVisible,
        isDeleted,
        createdTime,
        modifiedTime,
        icon,
        editor,
        banner,
        iconImage
      ]);
}

RubricsStateTypeStruct createRubricsStateTypeStruct({
  String? id,
  String? name,
  bool? isVisible,
  bool? isDeleted,
  DateTime? createdTime,
  DateTime? modifiedTime,
  FeedCardIcon? icon,
  Editor? editor,
  String? banner,
  String? iconImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RubricsStateTypeStruct(
      id: id,
      name: name,
      isVisible: isVisible,
      isDeleted: isDeleted,
      createdTime: createdTime,
      modifiedTime: modifiedTime,
      icon: icon,
      editor: editor,
      banner: banner,
      iconImage: iconImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RubricsStateTypeStruct? updateRubricsStateTypeStruct(
  RubricsStateTypeStruct? rubricsStateType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rubricsStateType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRubricsStateTypeStructData(
  Map<String, dynamic> firestoreData,
  RubricsStateTypeStruct? rubricsStateType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rubricsStateType == null) {
    return;
  }
  if (rubricsStateType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rubricsStateType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rubricsStateTypeData =
      getRubricsStateTypeFirestoreData(rubricsStateType, forFieldValue);
  final nestedData =
      rubricsStateTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rubricsStateType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRubricsStateTypeFirestoreData(
  RubricsStateTypeStruct? rubricsStateType, [
  bool forFieldValue = false,
]) {
  if (rubricsStateType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rubricsStateType.toMap());

  // Add any Firestore field values
  rubricsStateType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRubricsStateTypeListFirestoreData(
  List<RubricsStateTypeStruct>? rubricsStateTypes,
) =>
    rubricsStateTypes
        ?.map((e) => getRubricsStateTypeFirestoreData(e, true))
        .toList() ??
    [];
