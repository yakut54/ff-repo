import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharesRecord extends FirestoreRecord {
  SharesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rubric_ref" field.
  DocumentReference? _rubricRef;
  DocumentReference? get rubricRef => _rubricRef;
  bool hasRubricRef() => _rubricRef != null;

  // "article_ref" field.
  DocumentReference? _articleRef;
  DocumentReference? get articleRef => _articleRef;
  bool hasArticleRef() => _articleRef != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "openned_by" field.
  List<DocumentReference>? _opennedBy;
  List<DocumentReference> get opennedBy => _opennedBy ?? const [];
  bool hasOpennedBy() => _opennedBy != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _rubricRef = snapshotData['rubric_ref'] as DocumentReference?;
    _articleRef = snapshotData['article_ref'] as DocumentReference?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _opennedBy = getDataList(snapshotData['openned_by']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shares');

  static Stream<SharesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharesRecord.fromSnapshot(s));

  static Future<SharesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharesRecord.fromSnapshot(s));

  static SharesRecord fromSnapshot(DocumentSnapshot snapshot) => SharesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SharesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSharesRecordData({
  DocumentReference? rubricRef,
  DocumentReference? articleRef,
  DocumentReference? createdBy,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rubric_ref': rubricRef,
      'article_ref': articleRef,
      'created_by': createdBy,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SharesRecordDocumentEquality implements Equality<SharesRecord> {
  const SharesRecordDocumentEquality();

  @override
  bool equals(SharesRecord? e1, SharesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rubricRef == e2?.rubricRef &&
        e1?.articleRef == e2?.articleRef &&
        e1?.createdBy == e2?.createdBy &&
        listEquality.equals(e1?.opennedBy, e2?.opennedBy) &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(SharesRecord? e) => const ListEquality().hash([
        e?.rubricRef,
        e?.articleRef,
        e?.createdBy,
        e?.opennedBy,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is SharesRecord;
}
