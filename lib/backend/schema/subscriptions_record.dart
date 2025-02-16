import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subscription_end_time" field.
  DateTime? _subscriptionEndTime;
  DateTime? get subscriptionEndTime => _subscriptionEndTime;
  bool hasSubscriptionEndTime() => _subscriptionEndTime != null;

  // "status" field.
  SubscriptionStatus? _status;
  SubscriptionStatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _subscriptionEndTime = snapshotData['subscription_end_time'] as DateTime?;
    _status = snapshotData['status'] is SubscriptionStatus
        ? snapshotData['status']
        : deserializeEnum<SubscriptionStatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  DateTime? subscriptionEndTime,
  SubscriptionStatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subscription_end_time': subscriptionEndTime,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    return e1?.subscriptionEndTime == e2?.subscriptionEndTime &&
        e1?.status == e2?.status;
  }

  @override
  int hash(SubscriptionsRecord? e) =>
      const ListEquality().hash([e?.subscriptionEndTime, e?.status]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
