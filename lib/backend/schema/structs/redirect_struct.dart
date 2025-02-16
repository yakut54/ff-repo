// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RedirectStruct extends FFFirebaseStruct {
  RedirectStruct({
    DocumentReference? articlesRef,
    DocumentReference? rubricsRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _articlesRef = articlesRef,
        _rubricsRef = rubricsRef,
        super(firestoreUtilData);

  // "articles_ref" field.
  DocumentReference? _articlesRef;
  DocumentReference? get articlesRef => _articlesRef;
  set articlesRef(DocumentReference? val) => _articlesRef = val;

  bool hasArticlesRef() => _articlesRef != null;

  // "rubrics_ref" field.
  DocumentReference? _rubricsRef;
  DocumentReference? get rubricsRef => _rubricsRef;
  set rubricsRef(DocumentReference? val) => _rubricsRef = val;

  bool hasRubricsRef() => _rubricsRef != null;

  static RedirectStruct fromMap(Map<String, dynamic> data) => RedirectStruct(
        articlesRef: data['articles_ref'] as DocumentReference?,
        rubricsRef: data['rubrics_ref'] as DocumentReference?,
      );

  static RedirectStruct? maybeFromMap(dynamic data) =>
      data is Map ? RedirectStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'articles_ref': _articlesRef,
        'rubrics_ref': _rubricsRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'articles_ref': serializeParam(
          _articlesRef,
          ParamType.DocumentReference,
        ),
        'rubrics_ref': serializeParam(
          _rubricsRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static RedirectStruct fromSerializableMap(Map<String, dynamic> data) =>
      RedirectStruct(
        articlesRef: deserializeParam(
          data['articles_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['articles'],
        ),
        rubricsRef: deserializeParam(
          data['rubrics_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['rubrics'],
        ),
      );

  @override
  String toString() => 'RedirectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RedirectStruct &&
        articlesRef == other.articlesRef &&
        rubricsRef == other.rubricsRef;
  }

  @override
  int get hashCode => const ListEquality().hash([articlesRef, rubricsRef]);
}

RedirectStruct createRedirectStruct({
  DocumentReference? articlesRef,
  DocumentReference? rubricsRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RedirectStruct(
      articlesRef: articlesRef,
      rubricsRef: rubricsRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RedirectStruct? updateRedirectStruct(
  RedirectStruct? redirect, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    redirect
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRedirectStructData(
  Map<String, dynamic> firestoreData,
  RedirectStruct? redirect,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (redirect == null) {
    return;
  }
  if (redirect.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && redirect.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final redirectData = getRedirectFirestoreData(redirect, forFieldValue);
  final nestedData = redirectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = redirect.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRedirectFirestoreData(
  RedirectStruct? redirect, [
  bool forFieldValue = false,
]) {
  if (redirect == null) {
    return {};
  }
  final firestoreData = mapToFirestore(redirect.toMap());

  // Add any Firestore field values
  redirect.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRedirectListFirestoreData(
  List<RedirectStruct>? redirects,
) =>
    redirects?.map((e) => getRedirectFirestoreData(e, true)).toList() ?? [];
