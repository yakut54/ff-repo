// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserInteractionStruct extends FFFirebaseStruct {
  UserInteractionStruct({
    DocumentReference? user,
    DateTime? timestamp,
    Role? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _timestamp = timestamp,
        _role = role,
        super(firestoreUtilData);

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  set user(DocumentReference? val) => _user = val;

  bool hasUser() => _user != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "role" field.
  Role? _role;
  Role? get role => _role;
  set role(Role? val) => _role = val;

  bool hasRole() => _role != null;

  static UserInteractionStruct fromMap(Map<String, dynamic> data) =>
      UserInteractionStruct(
        user: data['user'] as DocumentReference?,
        timestamp: data['timestamp'] as DateTime?,
        role: data['role'] is Role
            ? data['role']
            : deserializeEnum<Role>(data['role']),
      );

  static UserInteractionStruct? maybeFromMap(dynamic data) => data is Map
      ? UserInteractionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'timestamp': _timestamp,
        'role': _role?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.DocumentReference,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'role': serializeParam(
          _role,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static UserInteractionStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInteractionStruct(
        user: deserializeParam(
          data['user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        role: deserializeParam<Role>(
          data['role'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'UserInteractionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInteractionStruct &&
        user == other.user &&
        timestamp == other.timestamp &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([user, timestamp, role]);
}

UserInteractionStruct createUserInteractionStruct({
  DocumentReference? user,
  DateTime? timestamp,
  Role? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInteractionStruct(
      user: user,
      timestamp: timestamp,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInteractionStruct? updateUserInteractionStruct(
  UserInteractionStruct? userInteraction, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInteraction
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInteractionStructData(
  Map<String, dynamic> firestoreData,
  UserInteractionStruct? userInteraction,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInteraction == null) {
    return;
  }
  if (userInteraction.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInteraction.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInteractionData =
      getUserInteractionFirestoreData(userInteraction, forFieldValue);
  final nestedData =
      userInteractionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userInteraction.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInteractionFirestoreData(
  UserInteractionStruct? userInteraction, [
  bool forFieldValue = false,
]) {
  if (userInteraction == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInteraction.toMap());

  // Add any Firestore field values
  userInteraction.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInteractionListFirestoreData(
  List<UserInteractionStruct>? userInteractions,
) =>
    userInteractions
        ?.map((e) => getUserInteractionFirestoreData(e, true))
        .toList() ??
    [];
