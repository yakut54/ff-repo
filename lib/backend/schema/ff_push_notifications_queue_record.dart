import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FfPushNotificationsQueueRecord extends FirestoreRecord {
  FfPushNotificationsQueueRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_title" field.
  String? _notificationTitle;
  String get notificationTitle => _notificationTitle ?? '';
  bool hasNotificationTitle() => _notificationTitle != null;

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "notification_image_url" field.
  String? _notificationImageUrl;
  String get notificationImageUrl => _notificationImageUrl ?? '';
  bool hasNotificationImageUrl() => _notificationImageUrl != null;

  // "ff_push_notifications_id" field.
  String? _ffPushNotificationsId;
  String get ffPushNotificationsId => _ffPushNotificationsId ?? '';
  bool hasFfPushNotificationsId() => _ffPushNotificationsId != null;

  // "status" field.
  NotificationStatus? _status;
  NotificationStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "dispatch_time" field.
  String? _dispatchTime;
  String get dispatchTime => _dispatchTime ?? '';
  bool hasDispatchTime() => _dispatchTime != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "views" field.
  List<DocumentReference>? _views;
  List<DocumentReference> get views => _views ?? const [];
  bool hasViews() => _views != null;

  // "users_counter" field.
  int? _usersCounter;
  int get usersCounter => _usersCounter ?? 0;
  bool hasUsersCounter() => _usersCounter != null;

  // "clicks_counter" field.
  int? _clicksCounter;
  int get clicksCounter => _clicksCounter ?? 0;
  bool hasClicksCounter() => _clicksCounter != null;

  // "redirect" field.
  RedirectStruct? _redirect;
  RedirectStruct get redirect => _redirect ?? RedirectStruct();
  bool hasRedirect() => _redirect != null;

  // "user_refs" field.
  List<DocumentReference>? _userRefs;
  List<DocumentReference> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  void _initializeFields() {
    _notificationTitle = snapshotData['notification_title'] as String?;
    _notificationText = snapshotData['notification_text'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _notificationImageUrl = snapshotData['notification_image_url'] as String?;
    _ffPushNotificationsId =
        snapshotData['ff_push_notifications_id'] as String?;
    _status = snapshotData['status'] is NotificationStatus
        ? snapshotData['status']
        : deserializeEnum<NotificationStatus>(snapshotData['status']);
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _dispatchTime = snapshotData['dispatch_time'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _views = getDataList(snapshotData['views']);
    _usersCounter = castToType<int>(snapshotData['users_counter']);
    _clicksCounter = castToType<int>(snapshotData['clicks_counter']);
    _redirect = snapshotData['redirect'] is RedirectStruct
        ? snapshotData['redirect']
        : RedirectStruct.maybeFromMap(snapshotData['redirect']);
    _userRefs = getDataList(snapshotData['user_refs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ff_push_notifications_queue');

  static Stream<FfPushNotificationsQueueRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => FfPushNotificationsQueueRecord.fromSnapshot(s));

  static Future<FfPushNotificationsQueueRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FfPushNotificationsQueueRecord.fromSnapshot(s));

  static FfPushNotificationsQueueRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      FfPushNotificationsQueueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FfPushNotificationsQueueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FfPushNotificationsQueueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FfPushNotificationsQueueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FfPushNotificationsQueueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFfPushNotificationsQueueRecordData({
  String? notificationTitle,
  String? notificationText,
  DateTime? createdTime,
  DateTime? modifiedTime,
  String? notificationImageUrl,
  String? ffPushNotificationsId,
  NotificationStatus? status,
  bool? isDeleted,
  String? dispatchTime,
  DateTime? timestamp,
  int? usersCounter,
  int? clicksCounter,
  RedirectStruct? redirect,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_title': notificationTitle,
      'notification_text': notificationText,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'notification_image_url': notificationImageUrl,
      'ff_push_notifications_id': ffPushNotificationsId,
      'status': status,
      'is_deleted': isDeleted,
      'dispatch_time': dispatchTime,
      'timestamp': timestamp,
      'users_counter': usersCounter,
      'clicks_counter': clicksCounter,
      'redirect': RedirectStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "redirect" field.
  addRedirectStructData(firestoreData, redirect, 'redirect');

  return firestoreData;
}

class FfPushNotificationsQueueRecordDocumentEquality
    implements Equality<FfPushNotificationsQueueRecord> {
  const FfPushNotificationsQueueRecordDocumentEquality();

  @override
  bool equals(
      FfPushNotificationsQueueRecord? e1, FfPushNotificationsQueueRecord? e2) {
    const listEquality = ListEquality();
    return e1?.notificationTitle == e2?.notificationTitle &&
        e1?.notificationText == e2?.notificationText &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.notificationImageUrl == e2?.notificationImageUrl &&
        e1?.ffPushNotificationsId == e2?.ffPushNotificationsId &&
        e1?.status == e2?.status &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.dispatchTime == e2?.dispatchTime &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.views, e2?.views) &&
        e1?.usersCounter == e2?.usersCounter &&
        e1?.clicksCounter == e2?.clicksCounter &&
        e1?.redirect == e2?.redirect &&
        listEquality.equals(e1?.userRefs, e2?.userRefs);
  }

  @override
  int hash(FfPushNotificationsQueueRecord? e) => const ListEquality().hash([
        e?.notificationTitle,
        e?.notificationText,
        e?.createdTime,
        e?.modifiedTime,
        e?.notificationImageUrl,
        e?.ffPushNotificationsId,
        e?.status,
        e?.isDeleted,
        e?.dispatchTime,
        e?.timestamp,
        e?.views,
        e?.usersCounter,
        e?.clicksCounter,
        e?.redirect,
        e?.userRefs
      ]);

  @override
  bool isValidKey(Object? o) => o is FfPushNotificationsQueueRecord;
}
