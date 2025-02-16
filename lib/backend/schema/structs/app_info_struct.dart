// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AppInfoStruct extends FFFirebaseStruct {
  AppInfoStruct({
    String? build,
    String? version,
    String? packageName,
    String? appName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _build = build,
        _version = version,
        _packageName = packageName,
        _appName = appName,
        super(firestoreUtilData);

  // "build" field.
  String? _build;
  String get build => _build ?? '';
  set build(String? val) => _build = val;

  bool hasBuild() => _build != null;

  // "version" field.
  String? _version;
  String get version => _version ?? '';
  set version(String? val) => _version = val;

  bool hasVersion() => _version != null;

  // "packageName" field.
  String? _packageName;
  String get packageName => _packageName ?? '';
  set packageName(String? val) => _packageName = val;

  bool hasPackageName() => _packageName != null;

  // "appName" field.
  String? _appName;
  String get appName => _appName ?? '';
  set appName(String? val) => _appName = val;

  bool hasAppName() => _appName != null;

  static AppInfoStruct fromMap(Map<String, dynamic> data) => AppInfoStruct(
        build: data['build'] as String?,
        version: data['version'] as String?,
        packageName: data['packageName'] as String?,
        appName: data['appName'] as String?,
      );

  static AppInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? AppInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'build': _build,
        'version': _version,
        'packageName': _packageName,
        'appName': _appName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'build': serializeParam(
          _build,
          ParamType.String,
        ),
        'version': serializeParam(
          _version,
          ParamType.String,
        ),
        'packageName': serializeParam(
          _packageName,
          ParamType.String,
        ),
        'appName': serializeParam(
          _appName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppInfoStruct(
        build: deserializeParam(
          data['build'],
          ParamType.String,
          false,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.String,
          false,
        ),
        packageName: deserializeParam(
          data['packageName'],
          ParamType.String,
          false,
        ),
        appName: deserializeParam(
          data['appName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppInfoStruct &&
        build == other.build &&
        version == other.version &&
        packageName == other.packageName &&
        appName == other.appName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([build, version, packageName, appName]);
}

AppInfoStruct createAppInfoStruct({
  String? build,
  String? version,
  String? packageName,
  String? appName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppInfoStruct(
      build: build,
      version: version,
      packageName: packageName,
      appName: appName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppInfoStruct? updateAppInfoStruct(
  AppInfoStruct? appInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppInfoStructData(
  Map<String, dynamic> firestoreData,
  AppInfoStruct? appInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appInfo == null) {
    return;
  }
  if (appInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appInfoData = getAppInfoFirestoreData(appInfo, forFieldValue);
  final nestedData = appInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppInfoFirestoreData(
  AppInfoStruct? appInfo, [
  bool forFieldValue = false,
]) {
  if (appInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appInfo.toMap());

  // Add any Firestore field values
  appInfo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppInfoListFirestoreData(
  List<AppInfoStruct>? appInfos,
) =>
    appInfos?.map((e) => getAppInfoFirestoreData(e, true)).toList() ?? [];
