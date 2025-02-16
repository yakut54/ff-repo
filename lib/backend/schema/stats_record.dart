import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatsRecord extends FirestoreRecord {
  StatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "anonymous_users" field.
  List<DocumentReference>? _anonymousUsers;
  List<DocumentReference> get anonymousUsers => _anonymousUsers ?? const [];
  bool hasAnonymousUsers() => _anonymousUsers != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "online" field.
  List<UserInteractionStruct>? _online;
  List<UserInteractionStruct> get online => _online ?? const [];
  bool hasOnline() => _online != null;

  // "online_count" field.
  int? _onlineCount;
  int get onlineCount => _onlineCount ?? 0;
  bool hasOnlineCount() => _onlineCount != null;

  // "users_count" field.
  int? _usersCount;
  int get usersCount => _usersCount ?? 0;
  bool hasUsersCount() => _usersCount != null;

  // "anonymous_users_count" field.
  int? _anonymousUsersCount;
  int get anonymousUsersCount => _anonymousUsersCount ?? 0;
  bool hasAnonymousUsersCount() => _anonymousUsersCount != null;

  void _initializeFields() {
    _anonymousUsers = getDataList(snapshotData['anonymous_users']);
    _users = getDataList(snapshotData['users']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _online = getStructList(
      snapshotData['online'],
      UserInteractionStruct.fromMap,
    );
    _onlineCount = castToType<int>(snapshotData['online_count']);
    _usersCount = castToType<int>(snapshotData['users_count']);
    _anonymousUsersCount =
        castToType<int>(snapshotData['anonymous_users_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stats');

  static Stream<StatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatsRecord.fromSnapshot(s));

  static Future<StatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatsRecord.fromSnapshot(s));

  static StatsRecord fromSnapshot(DocumentSnapshot snapshot) => StatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatsRecordData({
  DateTime? createdTime,
  int? onlineCount,
  int? usersCount,
  int? anonymousUsersCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'online_count': onlineCount,
      'users_count': usersCount,
      'anonymous_users_count': anonymousUsersCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatsRecordDocumentEquality implements Equality<StatsRecord> {
  const StatsRecordDocumentEquality();

  @override
  bool equals(StatsRecord? e1, StatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.anonymousUsers, e2?.anonymousUsers) &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.online, e2?.online) &&
        e1?.onlineCount == e2?.onlineCount &&
        e1?.usersCount == e2?.usersCount &&
        e1?.anonymousUsersCount == e2?.anonymousUsersCount;
  }

  @override
  int hash(StatsRecord? e) => const ListEquality().hash([
        e?.anonymousUsers,
        e?.users,
        e?.createdTime,
        e?.online,
        e?.onlineCount,
        e?.usersCount,
        e?.anonymousUsersCount
      ]);

  @override
  bool isValidKey(Object? o) => o is StatsRecord;
}
