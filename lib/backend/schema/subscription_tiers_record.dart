import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionTiersRecord extends FirestoreRecord {
  SubscriptionTiersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "user_refs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "interval" field.
  String? _interval;
  String get interval => _interval ?? '';
  bool hasInterval() => _interval != null;

  // "period" field.
  int? _period;
  int get period => _period ?? 0;
  bool hasPeriod() => _period != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _userRefs = getDataList(snapshotData['user_refs']);
    _amount = castToType<int>(snapshotData['amount']);
    _interval = snapshotData['interval'] as String?;
    _period = castToType<int>(snapshotData['period']);
    _banner = snapshotData['banner'] as String?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription_tiers');

  static Stream<SubscriptionTiersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionTiersRecord.fromSnapshot(s));

  static Future<SubscriptionTiersRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SubscriptionTiersRecord.fromSnapshot(s));

  static SubscriptionTiersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionTiersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionTiersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionTiersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionTiersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionTiersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionTiersRecordData({
  DateTime? createdTime,
  String? name,
  int? amount,
  String? interval,
  int? period,
  String? banner,
  DateTime? modifiedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'name': name,
      'amount': amount,
      'interval': interval,
      'period': period,
      'banner': banner,
      'modified_time': modifiedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionTiersRecordDocumentEquality
    implements Equality<SubscriptionTiersRecord> {
  const SubscriptionTiersRecordDocumentEquality();

  @override
  bool equals(SubscriptionTiersRecord? e1, SubscriptionTiersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.userRefs, e2?.userRefs) &&
        e1?.amount == e2?.amount &&
        e1?.interval == e2?.interval &&
        e1?.period == e2?.period &&
        e1?.banner == e2?.banner &&
        e1?.modifiedTime == e2?.modifiedTime;
  }

  @override
  int hash(SubscriptionTiersRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.name,
        e?.userRefs,
        e?.amount,
        e?.interval,
        e?.period,
        e?.banner,
        e?.modifiedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionTiersRecord;
}
