// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesStateTypeStruct extends FFFirebaseStruct {
  ArticlesStateTypeStruct({
    String? id,
    String? name,
    String? title,
    String? description,
    DateTime? createdTime,
    DateTime? modifiedTime,
    bool? isDeleted,
    List<ArticleBlockStruct>? articleBlocks,
    List<HoroscopeBlockStruct>? horoscopeBlocks,
    Editor? type,
    String? advice,
    List<CommentStruct>? comments,
    FeedAdditionalDataStruct? additional,
    bool? isVisible,
    String? startTime,
    String? endTime,
    bool? isPublished,
    DateTime? publishedTime,
    DocumentReference? ffPushNotificationsQueueRef,
    String? rubricDoc,
    List<String>? likes,
    List<String>? views,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _title = title,
        _description = description,
        _createdTime = createdTime,
        _modifiedTime = modifiedTime,
        _isDeleted = isDeleted,
        _articleBlocks = articleBlocks,
        _horoscopeBlocks = horoscopeBlocks,
        _type = type,
        _advice = advice,
        _comments = comments,
        _additional = additional,
        _isVisible = isVisible,
        _startTime = startTime,
        _endTime = endTime,
        _isPublished = isPublished,
        _publishedTime = publishedTime,
        _ffPushNotificationsQueueRef = ffPushNotificationsQueueRef,
        _rubricDoc = rubricDoc,
        _likes = likes,
        _views = views,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  set modifiedTime(DateTime? val) => _modifiedTime = val;

  bool hasModifiedTime() => _modifiedTime != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "article_blocks" field.
  List<ArticleBlockStruct>? _articleBlocks;
  List<ArticleBlockStruct> get articleBlocks => _articleBlocks ?? const [];
  set articleBlocks(List<ArticleBlockStruct>? val) => _articleBlocks = val;

  void updateArticleBlocks(Function(List<ArticleBlockStruct>) updateFn) {
    updateFn(_articleBlocks ??= []);
  }

  bool hasArticleBlocks() => _articleBlocks != null;

  // "horoscope_blocks" field.
  List<HoroscopeBlockStruct>? _horoscopeBlocks;
  List<HoroscopeBlockStruct> get horoscopeBlocks =>
      _horoscopeBlocks ?? const [];
  set horoscopeBlocks(List<HoroscopeBlockStruct>? val) =>
      _horoscopeBlocks = val;

  void updateHoroscopeBlocks(Function(List<HoroscopeBlockStruct>) updateFn) {
    updateFn(_horoscopeBlocks ??= []);
  }

  bool hasHoroscopeBlocks() => _horoscopeBlocks != null;

  // "type" field.
  Editor? _type;
  Editor? get type => _type;
  set type(Editor? val) => _type = val;

  bool hasType() => _type != null;

  // "advice" field.
  String? _advice;
  String get advice => _advice ?? '';
  set advice(String? val) => _advice = val;

  bool hasAdvice() => _advice != null;

  // "comments" field.
  List<CommentStruct>? _comments;
  List<CommentStruct> get comments => _comments ?? const [];
  set comments(List<CommentStruct>? val) => _comments = val;

  void updateComments(Function(List<CommentStruct>) updateFn) {
    updateFn(_comments ??= []);
  }

  bool hasComments() => _comments != null;

  // "additional" field.
  FeedAdditionalDataStruct? _additional;
  FeedAdditionalDataStruct get additional =>
      _additional ?? FeedAdditionalDataStruct();
  set additional(FeedAdditionalDataStruct? val) => _additional = val;

  void updateAdditional(Function(FeedAdditionalDataStruct) updateFn) {
    updateFn(_additional ??= FeedAdditionalDataStruct());
  }

  bool hasAdditional() => _additional != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "is_published" field.
  bool? _isPublished;
  bool get isPublished => _isPublished ?? false;
  set isPublished(bool? val) => _isPublished = val;

  bool hasIsPublished() => _isPublished != null;

  // "published_time" field.
  DateTime? _publishedTime;
  DateTime? get publishedTime => _publishedTime;
  set publishedTime(DateTime? val) => _publishedTime = val;

  bool hasPublishedTime() => _publishedTime != null;

  // "ff_push_notifications_queue_ref" field.
  DocumentReference? _ffPushNotificationsQueueRef;
  DocumentReference? get ffPushNotificationsQueueRef =>
      _ffPushNotificationsQueueRef;
  set ffPushNotificationsQueueRef(DocumentReference? val) =>
      _ffPushNotificationsQueueRef = val;

  bool hasFfPushNotificationsQueueRef() => _ffPushNotificationsQueueRef != null;

  // "rubric_doc" field.
  String? _rubricDoc;
  String get rubricDoc => _rubricDoc ?? '';
  set rubricDoc(String? val) => _rubricDoc = val;

  bool hasRubricDoc() => _rubricDoc != null;

  // "likes" field.
  List<String>? _likes;
  List<String> get likes => _likes ?? const [];
  set likes(List<String>? val) => _likes = val;

  void updateLikes(Function(List<String>) updateFn) {
    updateFn(_likes ??= []);
  }

  bool hasLikes() => _likes != null;

  // "views" field.
  List<String>? _views;
  List<String> get views => _views ?? const [];
  set views(List<String>? val) => _views = val;

  void updateViews(Function(List<String>) updateFn) {
    updateFn(_views ??= []);
  }

  bool hasViews() => _views != null;

  static ArticlesStateTypeStruct fromMap(Map<String, dynamic> data) =>
      ArticlesStateTypeStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        createdTime: data['created_time'] as DateTime?,
        modifiedTime: data['modified_time'] as DateTime?,
        isDeleted: data['is_deleted'] as bool?,
        articleBlocks: getStructList(
          data['article_blocks'],
          ArticleBlockStruct.fromMap,
        ),
        horoscopeBlocks: getStructList(
          data['horoscope_blocks'],
          HoroscopeBlockStruct.fromMap,
        ),
        type: data['type'] is Editor
            ? data['type']
            : deserializeEnum<Editor>(data['type']),
        advice: data['advice'] as String?,
        comments: getStructList(
          data['comments'],
          CommentStruct.fromMap,
        ),
        additional: data['additional'] is FeedAdditionalDataStruct
            ? data['additional']
            : FeedAdditionalDataStruct.maybeFromMap(data['additional']),
        isVisible: data['is_visible'] as bool?,
        startTime: data['start_time'] as String?,
        endTime: data['end_time'] as String?,
        isPublished: data['is_published'] as bool?,
        publishedTime: data['published_time'] as DateTime?,
        ffPushNotificationsQueueRef:
            data['ff_push_notifications_queue_ref'] as DocumentReference?,
        rubricDoc: data['rubric_doc'] as String?,
        likes: getDataList(data['likes']),
        views: getDataList(data['views']),
      );

  static ArticlesStateTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ArticlesStateTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'title': _title,
        'description': _description,
        'created_time': _createdTime,
        'modified_time': _modifiedTime,
        'is_deleted': _isDeleted,
        'article_blocks': _articleBlocks?.map((e) => e.toMap()).toList(),
        'horoscope_blocks': _horoscopeBlocks?.map((e) => e.toMap()).toList(),
        'type': _type?.serialize(),
        'advice': _advice,
        'comments': _comments?.map((e) => e.toMap()).toList(),
        'additional': _additional?.toMap(),
        'is_visible': _isVisible,
        'start_time': _startTime,
        'end_time': _endTime,
        'is_published': _isPublished,
        'published_time': _publishedTime,
        'ff_push_notifications_queue_ref': _ffPushNotificationsQueueRef,
        'rubric_doc': _rubricDoc,
        'likes': _likes,
        'views': _views,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'modified_time': serializeParam(
          _modifiedTime,
          ParamType.DateTime,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'article_blocks': serializeParam(
          _articleBlocks,
          ParamType.DataStruct,
          isList: true,
        ),
        'horoscope_blocks': serializeParam(
          _horoscopeBlocks,
          ParamType.DataStruct,
          isList: true,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'advice': serializeParam(
          _advice,
          ParamType.String,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.DataStruct,
          isList: true,
        ),
        'additional': serializeParam(
          _additional,
          ParamType.DataStruct,
        ),
        'is_visible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'is_published': serializeParam(
          _isPublished,
          ParamType.bool,
        ),
        'published_time': serializeParam(
          _publishedTime,
          ParamType.DateTime,
        ),
        'ff_push_notifications_queue_ref': serializeParam(
          _ffPushNotificationsQueueRef,
          ParamType.DocumentReference,
        ),
        'rubric_doc': serializeParam(
          _rubricDoc,
          ParamType.String,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.String,
          isList: true,
        ),
        'views': serializeParam(
          _views,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ArticlesStateTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ArticlesStateTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        modifiedTime: deserializeParam(
          data['modified_time'],
          ParamType.DateTime,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.bool,
          false,
        ),
        articleBlocks: deserializeStructParam<ArticleBlockStruct>(
          data['article_blocks'],
          ParamType.DataStruct,
          true,
          structBuilder: ArticleBlockStruct.fromSerializableMap,
        ),
        horoscopeBlocks: deserializeStructParam<HoroscopeBlockStruct>(
          data['horoscope_blocks'],
          ParamType.DataStruct,
          true,
          structBuilder: HoroscopeBlockStruct.fromSerializableMap,
        ),
        type: deserializeParam<Editor>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        advice: deserializeParam(
          data['advice'],
          ParamType.String,
          false,
        ),
        comments: deserializeStructParam<CommentStruct>(
          data['comments'],
          ParamType.DataStruct,
          true,
          structBuilder: CommentStruct.fromSerializableMap,
        ),
        additional: deserializeStructParam(
          data['additional'],
          ParamType.DataStruct,
          false,
          structBuilder: FeedAdditionalDataStruct.fromSerializableMap,
        ),
        isVisible: deserializeParam(
          data['is_visible'],
          ParamType.bool,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.String,
          false,
        ),
        isPublished: deserializeParam(
          data['is_published'],
          ParamType.bool,
          false,
        ),
        publishedTime: deserializeParam(
          data['published_time'],
          ParamType.DateTime,
          false,
        ),
        ffPushNotificationsQueueRef: deserializeParam(
          data['ff_push_notifications_queue_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['ff_push_notifications_queue'],
        ),
        rubricDoc: deserializeParam(
          data['rubric_doc'],
          ParamType.String,
          false,
        ),
        likes: deserializeParam<String>(
          data['likes'],
          ParamType.String,
          true,
        ),
        views: deserializeParam<String>(
          data['views'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ArticlesStateTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ArticlesStateTypeStruct &&
        id == other.id &&
        name == other.name &&
        title == other.title &&
        description == other.description &&
        createdTime == other.createdTime &&
        modifiedTime == other.modifiedTime &&
        isDeleted == other.isDeleted &&
        listEquality.equals(articleBlocks, other.articleBlocks) &&
        listEquality.equals(horoscopeBlocks, other.horoscopeBlocks) &&
        type == other.type &&
        advice == other.advice &&
        listEquality.equals(comments, other.comments) &&
        additional == other.additional &&
        isVisible == other.isVisible &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        isPublished == other.isPublished &&
        publishedTime == other.publishedTime &&
        ffPushNotificationsQueueRef == other.ffPushNotificationsQueueRef &&
        rubricDoc == other.rubricDoc &&
        listEquality.equals(likes, other.likes) &&
        listEquality.equals(views, other.views);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        title,
        description,
        createdTime,
        modifiedTime,
        isDeleted,
        articleBlocks,
        horoscopeBlocks,
        type,
        advice,
        comments,
        additional,
        isVisible,
        startTime,
        endTime,
        isPublished,
        publishedTime,
        ffPushNotificationsQueueRef,
        rubricDoc,
        likes,
        views
      ]);
}

ArticlesStateTypeStruct createArticlesStateTypeStruct({
  String? id,
  String? name,
  String? title,
  String? description,
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
  String? rubricDoc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArticlesStateTypeStruct(
      id: id,
      name: name,
      title: title,
      description: description,
      createdTime: createdTime,
      modifiedTime: modifiedTime,
      isDeleted: isDeleted,
      type: type,
      advice: advice,
      additional:
          additional ?? (clearUnsetFields ? FeedAdditionalDataStruct() : null),
      isVisible: isVisible,
      startTime: startTime,
      endTime: endTime,
      isPublished: isPublished,
      publishedTime: publishedTime,
      ffPushNotificationsQueueRef: ffPushNotificationsQueueRef,
      rubricDoc: rubricDoc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArticlesStateTypeStruct? updateArticlesStateTypeStruct(
  ArticlesStateTypeStruct? articlesStateType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    articlesStateType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArticlesStateTypeStructData(
  Map<String, dynamic> firestoreData,
  ArticlesStateTypeStruct? articlesStateType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (articlesStateType == null) {
    return;
  }
  if (articlesStateType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && articlesStateType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final articlesStateTypeData =
      getArticlesStateTypeFirestoreData(articlesStateType, forFieldValue);
  final nestedData =
      articlesStateTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = articlesStateType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArticlesStateTypeFirestoreData(
  ArticlesStateTypeStruct? articlesStateType, [
  bool forFieldValue = false,
]) {
  if (articlesStateType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(articlesStateType.toMap());

  // Handle nested data for "additional" field.
  addFeedAdditionalDataStructData(
    firestoreData,
    articlesStateType.hasAdditional() ? articlesStateType.additional : null,
    'additional',
    forFieldValue,
  );

  // Add any Firestore field values
  articlesStateType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArticlesStateTypeListFirestoreData(
  List<ArticlesStateTypeStruct>? articlesStateTypes,
) =>
    articlesStateTypes
        ?.map((e) => getArticlesStateTypeFirestoreData(e, true))
        .toList() ??
    [];
