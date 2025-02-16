import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesRecord extends FirestoreRecord {
  ArticlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "rubrics_ref" field.
  DocumentReference? _rubricsRef;
  DocumentReference? get rubricsRef => _rubricsRef;
  bool hasRubricsRef() => _rubricsRef != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "article_blocks" field.
  List<ArticleBlockStruct>? _articleBlocks;
  List<ArticleBlockStruct> get articleBlocks => _articleBlocks ?? const [];
  bool hasArticleBlocks() => _articleBlocks != null;

  // "horoscope_blocks" field.
  List<HoroscopeBlockStruct>? _horoscopeBlocks;
  List<HoroscopeBlockStruct> get horoscopeBlocks =>
      _horoscopeBlocks ?? const [];
  bool hasHoroscopeBlocks() => _horoscopeBlocks != null;

  // "type" field.
  Editor? _type;
  Editor? get type => _type;
  bool hasType() => _type != null;

  // "advice" field.
  String? _advice;
  String get advice => _advice ?? '';
  bool hasAdvice() => _advice != null;

  // "comments" field.
  List<CommentStruct>? _comments;
  List<CommentStruct> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "views" field.
  List<DocumentReference>? _views;
  List<DocumentReference> get views => _views ?? const [];
  bool hasViews() => _views != null;

  // "additional" field.
  FeedAdditionalDataStruct? _additional;
  FeedAdditionalDataStruct get additional =>
      _additional ?? FeedAdditionalDataStruct();
  bool hasAdditional() => _additional != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  bool hasIsVisible() => _isVisible != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  bool hasEndTime() => _endTime != null;

  // "is_published" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  bool hasIsPublished() => _isPublished != null;

  // "published_time" field.
  DateTime? _publishedTime;
  DateTime? get publishedTime => _publishedTime;
  bool hasPublishedTime() => _publishedTime != null;

  // "ff_push_notifications_queue_ref" field.
  DocumentReference? _ffPushNotificationsQueueRef;
  DocumentReference? get ffPushNotificationsQueueRef =>
      _ffPushNotificationsQueueRef;
  bool hasFfPushNotificationsQueueRef() => _ffPushNotificationsQueueRef != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _rubricsRef = snapshotData['rubrics_ref'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _articleBlocks = getStructList(
      snapshotData['article_blocks'],
      ArticleBlockStruct.fromMap,
    );
    _horoscopeBlocks = getStructList(
      snapshotData['horoscope_blocks'],
      HoroscopeBlockStruct.fromMap,
    );
    _type = snapshotData['type'] is Editor
        ? snapshotData['type']
        : deserializeEnum<Editor>(snapshotData['type']);
    _advice = snapshotData['advice'] as String?;
    _comments = getStructList(
      snapshotData['comments'],
      CommentStruct.fromMap,
    );
    _views = getDataList(snapshotData['views']);
    _additional = snapshotData['additional'] is FeedAdditionalDataStruct
        ? snapshotData['additional']
        : FeedAdditionalDataStruct.maybeFromMap(snapshotData['additional']);
    _isVisible = snapshotData['is_visible'] as bool?;
    _startTime = snapshotData['start_time'] as String?;
    _endTime = snapshotData['end_time'] as String?;
    _isPublished = snapshotData['is_published'] as bool?;
    _publishedTime = snapshotData['published_time'] as DateTime?;
    _ffPushNotificationsQueueRef =
        snapshotData['ff_push_notifications_queue_ref'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('articles');

  static Stream<ArticlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesRecord.fromSnapshot(s));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticlesRecord.fromSnapshot(s));

  static ArticlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesRecordData({
  String? name,
  String? title,
  String? description,
  DocumentReference? rubricsRef,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? isDeleted,
  Editor? type,
  String? advice,
  FeedAdditionalDataStruct? additional,
  bool? isVisible,
  String? startTime,
  String? endTime,
  bool? isPublished,
  DateTime? publishedTime,
  DocumentReference? ffPushNotificationsQueueRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'title': title,
      'description': description,
      'rubrics_ref': rubricsRef,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'is_deleted': isDeleted,
      'type': type,
      'advice': advice,
      'additional': FeedAdditionalDataStruct().toMap(),
      'is_visible': isVisible,
      'start_time': startTime,
      'end_time': endTime,
      'is_published': isPublished,
      'published_time': publishedTime,
      'ff_push_notifications_queue_ref': ffPushNotificationsQueueRef,
    }.withoutNulls,
  );

  // Handle nested data for "additional" field.
  addFeedAdditionalDataStructData(firestoreData, additional, 'additional');

  return firestoreData;
}

class ArticlesRecordDocumentEquality implements Equality<ArticlesRecord> {
  const ArticlesRecordDocumentEquality();

  @override
  bool equals(ArticlesRecord? e1, ArticlesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.rubricsRef == e2?.rubricsRef &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.isDeleted == e2?.isDeleted &&
        listEquality.equals(e1?.articleBlocks, e2?.articleBlocks) &&
        listEquality.equals(e1?.horoscopeBlocks, e2?.horoscopeBlocks) &&
        e1?.type == e2?.type &&
        e1?.advice == e2?.advice &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        listEquality.equals(e1?.views, e2?.views) &&
        e1?.additional == e2?.additional &&
        e1?.isVisible == e2?.isVisible &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.isPublished == e2?.isPublished &&
        e1?.publishedTime == e2?.publishedTime &&
        e1?.ffPushNotificationsQueueRef == e2?.ffPushNotificationsQueueRef &&
        listEquality.equals(e1?.likes, e2?.likes);
  }

  @override
  int hash(ArticlesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.title,
        e?.description,
        e?.rubricsRef,
        e?.createdTime,
        e?.modifiedTime,
        e?.isDeleted,
        e?.articleBlocks,
        e?.horoscopeBlocks,
        e?.type,
        e?.advice,
        e?.comments,
        e?.views,
        e?.additional,
        e?.isVisible,
        e?.startTime,
        e?.endTime,
        e?.isPublished,
        e?.publishedTime,
        e?.ffPushNotificationsQueueRef,
        e?.likes
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesRecord;
}
