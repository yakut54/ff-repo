// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OtpStruct extends FFFirebaseStruct {
  OtpStruct({
    DateTime? createdTime,
    String? phone,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _phone = phone,
        _code = code,
        super(firestoreUtilData);

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static OtpStruct fromMap(Map<String, dynamic> data) => OtpStruct(
        createdTime: data['created_time'] as DateTime?,
        phone: data['phone'] as String?,
        code: data['code'] as String?,
      );

  static OtpStruct? maybeFromMap(dynamic data) =>
      data is Map ? OtpStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'created_time': _createdTime,
        'phone': _phone,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static OtpStruct fromSerializableMap(Map<String, dynamic> data) => OtpStruct(
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OtpStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OtpStruct &&
        createdTime == other.createdTime &&
        phone == other.phone &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([createdTime, phone, code]);
}

OtpStruct createOtpStruct({
  DateTime? createdTime,
  String? phone,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OtpStruct(
      createdTime: createdTime,
      phone: phone,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OtpStruct? updateOtpStruct(
  OtpStruct? otp, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    otp
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOtpStructData(
  Map<String, dynamic> firestoreData,
  OtpStruct? otp,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (otp == null) {
    return;
  }
  if (otp.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && otp.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final otpData = getOtpFirestoreData(otp, forFieldValue);
  final nestedData = otpData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = otp.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOtpFirestoreData(
  OtpStruct? otp, [
  bool forFieldValue = false,
]) {
  if (otp == null) {
    return {};
  }
  final firestoreData = mapToFirestore(otp.toMap());

  // Add any Firestore field values
  otp.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOtpListFirestoreData(
  List<OtpStruct>? otps,
) =>
    otps?.map((e) => getOtpFirestoreData(e, true)).toList() ?? [];
