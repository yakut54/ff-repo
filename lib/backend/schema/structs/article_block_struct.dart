// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ArticleBlockStruct extends FFFirebaseStruct {
  ArticleBlockStruct({
    ArticleBlockType? type,
    String? text,
    String? link,
    String? image,
    String? author,
    DateTime? time,
    String? widgetKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _text = text,
        _link = link,
        _image = image,
        _author = author,
        _time = time,
        _widgetKey = widgetKey,
        super(firestoreUtilData);

  // "type" field.
  ArticleBlockType? _type;
  ArticleBlockType? get type => _type;
  set type(ArticleBlockType? val) => _type = val;

  bool hasType() => _type != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "widgetKey" field.
  String? _widgetKey;
  String get widgetKey => _widgetKey ?? '';
  set widgetKey(String? val) => _widgetKey = val;

  bool hasWidgetKey() => _widgetKey != null;

  static ArticleBlockStruct fromMap(Map<String, dynamic> data) =>
      ArticleBlockStruct(
        type: data['type'] is ArticleBlockType
            ? data['type']
            : deserializeEnum<ArticleBlockType>(data['type']),
        text: data['text'] as String?,
        link: data['link'] as String?,
        image: data['image'] as String?,
        author: data['author'] as String?,
        time: data['time'] as DateTime?,
        widgetKey: data['widgetKey'] as String?,
      );

  static ArticleBlockStruct? maybeFromMap(dynamic data) => data is Map
      ? ArticleBlockStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'text': _text,
        'link': _link,
        'image': _image,
        'author': _author,
        'time': _time,
        'widgetKey': _widgetKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'widgetKey': serializeParam(
          _widgetKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static ArticleBlockStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArticleBlockStruct(
        type: deserializeParam<ArticleBlockType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        widgetKey: deserializeParam(
          data['widgetKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ArticleBlockStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArticleBlockStruct &&
        type == other.type &&
        text == other.text &&
        link == other.link &&
        image == other.image &&
        author == other.author &&
        time == other.time &&
        widgetKey == other.widgetKey;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([type, text, link, image, author, time, widgetKey]);
}

ArticleBlockStruct createArticleBlockStruct({
  ArticleBlockType? type,
  String? text,
  String? link,
  String? image,
  String? author,
  DateTime? time,
  String? widgetKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArticleBlockStruct(
      type: type,
      text: text,
      link: link,
      image: image,
      author: author,
      time: time,
      widgetKey: widgetKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArticleBlockStruct? updateArticleBlockStruct(
  ArticleBlockStruct? articleBlock, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    articleBlock
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArticleBlockStructData(
  Map<String, dynamic> firestoreData,
  ArticleBlockStruct? articleBlock,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (articleBlock == null) {
    return;
  }
  if (articleBlock.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && articleBlock.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final articleBlockData =
      getArticleBlockFirestoreData(articleBlock, forFieldValue);
  final nestedData =
      articleBlockData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = articleBlock.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArticleBlockFirestoreData(
  ArticleBlockStruct? articleBlock, [
  bool forFieldValue = false,
]) {
  if (articleBlock == null) {
    return {};
  }
  final firestoreData = mapToFirestore(articleBlock.toMap());

  // Add any Firestore field values
  articleBlock.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArticleBlockListFirestoreData(
  List<ArticleBlockStruct>? articleBlocks,
) =>
    articleBlocks?.map((e) => getArticleBlockFirestoreData(e, true)).toList() ??
    [];
