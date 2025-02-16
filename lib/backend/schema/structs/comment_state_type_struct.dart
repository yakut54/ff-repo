// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CommentStateTypeStruct extends FFFirebaseStruct {
  CommentStateTypeStruct({
    String? name,
    String? text,
    DateTime? createdTime,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _text = text,
        _createdTime = createdTime,
        _userId = userId,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  static CommentStateTypeStruct fromMap(Map<String, dynamic> data) =>
      CommentStateTypeStruct(
        name: data['name'] as String?,
        text: data['text'] as String?,
        createdTime: data['created_time'] as DateTime?,
        userId: data['user_id'] as String?,
      );

  static CommentStateTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentStateTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'text': _text,
        'created_time': _createdTime,
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommentStateTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CommentStateTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CommentStateTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStateTypeStruct &&
        name == other.name &&
        text == other.text &&
        createdTime == other.createdTime &&
        userId == other.userId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, text, createdTime, userId]);
}

CommentStateTypeStruct createCommentStateTypeStruct({
  String? name,
  String? text,
  DateTime? createdTime,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStateTypeStruct(
      name: name,
      text: text,
      createdTime: createdTime,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStateTypeStruct? updateCommentStateTypeStruct(
  CommentStateTypeStruct? commentStateType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commentStateType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStateTypeStructData(
  Map<String, dynamic> firestoreData,
  CommentStateTypeStruct? commentStateType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commentStateType == null) {
    return;
  }
  if (commentStateType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commentStateType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentStateTypeData =
      getCommentStateTypeFirestoreData(commentStateType, forFieldValue);
  final nestedData =
      commentStateTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commentStateType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentStateTypeFirestoreData(
  CommentStateTypeStruct? commentStateType, [
  bool forFieldValue = false,
]) {
  if (commentStateType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commentStateType.toMap());

  // Add any Firestore field values
  commentStateType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentStateTypeListFirestoreData(
  List<CommentStateTypeStruct>? commentStateTypes,
) =>
    commentStateTypes
        ?.map((e) => getCommentStateTypeFirestoreData(e, true))
        .toList() ??
    [];
