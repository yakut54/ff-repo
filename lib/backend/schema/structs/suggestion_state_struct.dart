// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SuggestionStateStruct extends FFFirebaseStruct {
  SuggestionStateStruct({
    String? name,
    String? link,
    bool? isDeleted,
    bool? isVisible,
    String? coverImage,
    DateTime? createdTime,
    DateTime? modifiedTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _link = link,
        _isDeleted = isDeleted,
        _isVisible = isVisible,
        _coverImage = coverImage,
        _createdTime = createdTime,
        _modifiedTime = modifiedTime,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  // "cover_image" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  set coverImage(String? val) => _coverImage = val;

  bool hasCoverImage() => _coverImage != null;

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

  static SuggestionStateStruct fromMap(Map<String, dynamic> data) =>
      SuggestionStateStruct(
        name: data['name'] as String?,
        link: data['link'] as String?,
        isDeleted: data['is_deleted'] as bool?,
        isVisible: data['is_visible'] as bool?,
        coverImage: data['cover_image'] as String?,
        createdTime: data['created_time'] as DateTime?,
        modifiedTime: data['modified_time'] as DateTime?,
      );

  static SuggestionStateStruct? maybeFromMap(dynamic data) => data is Map
      ? SuggestionStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'link': _link,
        'is_deleted': _isDeleted,
        'is_visible': _isVisible,
        'cover_image': _coverImage,
        'created_time': _createdTime,
        'modified_time': _modifiedTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'is_visible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
        'cover_image': serializeParam(
          _coverImage,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'modified_time': serializeParam(
          _modifiedTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SuggestionStateStruct fromSerializableMap(Map<String, dynamic> data) =>
      SuggestionStateStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.bool,
          false,
        ),
        isVisible: deserializeParam(
          data['is_visible'],
          ParamType.bool,
          false,
        ),
        coverImage: deserializeParam(
          data['cover_image'],
          ParamType.String,
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
      );

  @override
  String toString() => 'SuggestionStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SuggestionStateStruct &&
        name == other.name &&
        link == other.link &&
        isDeleted == other.isDeleted &&
        isVisible == other.isVisible &&
        coverImage == other.coverImage &&
        createdTime == other.createdTime &&
        modifiedTime == other.modifiedTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        link,
        isDeleted,
        isVisible,
        coverImage,
        createdTime,
        modifiedTime
      ]);
}

SuggestionStateStruct createSuggestionStateStruct({
  String? name,
  String? link,
  bool? isDeleted,
  bool? isVisible,
  String? coverImage,
  DateTime? createdTime,
  DateTime? modifiedTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SuggestionStateStruct(
      name: name,
      link: link,
      isDeleted: isDeleted,
      isVisible: isVisible,
      coverImage: coverImage,
      createdTime: createdTime,
      modifiedTime: modifiedTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SuggestionStateStruct? updateSuggestionStateStruct(
  SuggestionStateStruct? suggestionState, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    suggestionState
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSuggestionStateStructData(
  Map<String, dynamic> firestoreData,
  SuggestionStateStruct? suggestionState,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (suggestionState == null) {
    return;
  }
  if (suggestionState.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && suggestionState.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final suggestionStateData =
      getSuggestionStateFirestoreData(suggestionState, forFieldValue);
  final nestedData =
      suggestionStateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = suggestionState.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSuggestionStateFirestoreData(
  SuggestionStateStruct? suggestionState, [
  bool forFieldValue = false,
]) {
  if (suggestionState == null) {
    return {};
  }
  final firestoreData = mapToFirestore(suggestionState.toMap());

  // Add any Firestore field values
  suggestionState.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSuggestionStateListFirestoreData(
  List<SuggestionStateStruct>? suggestionStates,
) =>
    suggestionStates
        ?.map((e) => getSuggestionStateFirestoreData(e, true))
        .toList() ??
    [];
