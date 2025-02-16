// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AdminMenuStruct extends FFFirebaseStruct {
  AdminMenuStruct({
    AdminMenu? adminMenuEnum,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _adminMenuEnum = adminMenuEnum,
        _title = title,
        super(firestoreUtilData);

  // "AdminMenuEnum" field.
  AdminMenu? _adminMenuEnum;
  AdminMenu? get adminMenuEnum => _adminMenuEnum;
  set adminMenuEnum(AdminMenu? val) => _adminMenuEnum = val;

  bool hasAdminMenuEnum() => _adminMenuEnum != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static AdminMenuStruct fromMap(Map<String, dynamic> data) => AdminMenuStruct(
        adminMenuEnum: data['AdminMenuEnum'] is AdminMenu
            ? data['AdminMenuEnum']
            : deserializeEnum<AdminMenu>(data['AdminMenuEnum']),
        title: data['title'] as String?,
      );

  static AdminMenuStruct? maybeFromMap(dynamic data) => data is Map
      ? AdminMenuStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'AdminMenuEnum': _adminMenuEnum?.serialize(),
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AdminMenuEnum': serializeParam(
          _adminMenuEnum,
          ParamType.Enum,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static AdminMenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdminMenuStruct(
        adminMenuEnum: deserializeParam<AdminMenu>(
          data['AdminMenuEnum'],
          ParamType.Enum,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AdminMenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdminMenuStruct &&
        adminMenuEnum == other.adminMenuEnum &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([adminMenuEnum, title]);
}

AdminMenuStruct createAdminMenuStruct({
  AdminMenu? adminMenuEnum,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AdminMenuStruct(
      adminMenuEnum: adminMenuEnum,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AdminMenuStruct? updateAdminMenuStruct(
  AdminMenuStruct? adminMenu, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    adminMenu
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAdminMenuStructData(
  Map<String, dynamic> firestoreData,
  AdminMenuStruct? adminMenu,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (adminMenu == null) {
    return;
  }
  if (adminMenu.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && adminMenu.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final adminMenuData = getAdminMenuFirestoreData(adminMenu, forFieldValue);
  final nestedData = adminMenuData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = adminMenu.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAdminMenuFirestoreData(
  AdminMenuStruct? adminMenu, [
  bool forFieldValue = false,
]) {
  if (adminMenu == null) {
    return {};
  }
  final firestoreData = mapToFirestore(adminMenu.toMap());

  // Add any Firestore field values
  adminMenu.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAdminMenuListFirestoreData(
  List<AdminMenuStruct>? adminMenus,
) =>
    adminMenus?.map((e) => getAdminMenuFirestoreData(e, true)).toList() ?? [];
