import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AcquiringsRecord extends FirestoreRecord {
  AcquiringsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "type" field.
  Ecquiring? _type;
  Ecquiring? get type => _type;
  bool hasType() => _type != null;

  // "login" field.
  String? _login;
  String get login => _login ?? '';
  bool hasLogin() => _login != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] is Ecquiring
        ? snapshotData['type']
        : deserializeEnum<Ecquiring>(snapshotData['type']);
    _login = snapshotData['login'] as String?;
    _password = snapshotData['password'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('acquirings');

  static Stream<AcquiringsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcquiringsRecord.fromSnapshot(s));

  static Future<AcquiringsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AcquiringsRecord.fromSnapshot(s));

  static AcquiringsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcquiringsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcquiringsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcquiringsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcquiringsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcquiringsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcquiringsRecordData({
  String? name,
  Ecquiring? type,
  String? login,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'type': type,
      'login': login,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class AcquiringsRecordDocumentEquality implements Equality<AcquiringsRecord> {
  const AcquiringsRecordDocumentEquality();

  @override
  bool equals(AcquiringsRecord? e1, AcquiringsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.login == e2?.login &&
        e1?.password == e2?.password;
  }

  @override
  int hash(AcquiringsRecord? e) =>
      const ListEquality().hash([e?.name, e?.type, e?.login, e?.password]);

  @override
  bool isValidKey(Object? o) => o is AcquiringsRecord;
}
