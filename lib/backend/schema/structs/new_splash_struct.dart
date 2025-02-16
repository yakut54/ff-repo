// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NewSplashStruct extends FFFirebaseStruct {
  NewSplashStruct({
    String? image,
    String? text,
    String? title,
    String? btnText,
    String? link,
    bool? isVisible,
    bool? isDeleted,
    DateTime? createDate,
    String? greetingsText,
    String? cancelBtnText,
    String? firstText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _text = text,
        _title = title,
        _btnText = btnText,
        _link = link,
        _isVisible = isVisible,
        _isDeleted = isDeleted,
        _createDate = createDate,
        _greetingsText = greetingsText,
        _cancelBtnText = cancelBtnText,
        _firstText = firstText,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "btn_text" field.
  String? _btnText;
  String get btnText => _btnText ?? '';
  set btnText(String? val) => _btnText = val;

  bool hasBtnText() => _btnText != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  set createDate(DateTime? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  // "greetings_text" field.
  String? _greetingsText;
  String get greetingsText => _greetingsText ?? '';
  set greetingsText(String? val) => _greetingsText = val;

  bool hasGreetingsText() => _greetingsText != null;

  // "cancel_btn_text" field.
  String? _cancelBtnText;
  String get cancelBtnText => _cancelBtnText ?? '';
  set cancelBtnText(String? val) => _cancelBtnText = val;

  bool hasCancelBtnText() => _cancelBtnText != null;

  // "first_text" field.
  String? _firstText;
  String get firstText => _firstText ?? '';
  set firstText(String? val) => _firstText = val;

  bool hasFirstText() => _firstText != null;

  static NewSplashStruct fromMap(Map<String, dynamic> data) => NewSplashStruct(
        image: data['image'] as String?,
        text: data['text'] as String?,
        title: data['title'] as String?,
        btnText: data['btn_text'] as String?,
        link: data['link'] as String?,
        isVisible: data['is_visible'] as bool?,
        isDeleted: data['is_deleted'] as bool?,
        createDate: data['create_date'] as DateTime?,
        greetingsText: data['greetings_text'] as String?,
        cancelBtnText: data['cancel_btn_text'] as String?,
        firstText: data['first_text'] as String?,
      );

  static NewSplashStruct? maybeFromMap(dynamic data) => data is Map
      ? NewSplashStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'text': _text,
        'title': _title,
        'btn_text': _btnText,
        'link': _link,
        'is_visible': _isVisible,
        'is_deleted': _isDeleted,
        'create_date': _createDate,
        'greetings_text': _greetingsText,
        'cancel_btn_text': _cancelBtnText,
        'first_text': _firstText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'btn_text': serializeParam(
          _btnText,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'is_visible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'create_date': serializeParam(
          _createDate,
          ParamType.DateTime,
        ),
        'greetings_text': serializeParam(
          _greetingsText,
          ParamType.String,
        ),
        'cancel_btn_text': serializeParam(
          _cancelBtnText,
          ParamType.String,
        ),
        'first_text': serializeParam(
          _firstText,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewSplashStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewSplashStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        btnText: deserializeParam(
          data['btn_text'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        isVisible: deserializeParam(
          data['is_visible'],
          ParamType.bool,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.bool,
          false,
        ),
        createDate: deserializeParam(
          data['create_date'],
          ParamType.DateTime,
          false,
        ),
        greetingsText: deserializeParam(
          data['greetings_text'],
          ParamType.String,
          false,
        ),
        cancelBtnText: deserializeParam(
          data['cancel_btn_text'],
          ParamType.String,
          false,
        ),
        firstText: deserializeParam(
          data['first_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewSplashStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewSplashStruct &&
        image == other.image &&
        text == other.text &&
        title == other.title &&
        btnText == other.btnText &&
        link == other.link &&
        isVisible == other.isVisible &&
        isDeleted == other.isDeleted &&
        createDate == other.createDate &&
        greetingsText == other.greetingsText &&
        cancelBtnText == other.cancelBtnText &&
        firstText == other.firstText;
  }

  @override
  int get hashCode => const ListEquality().hash([
        image,
        text,
        title,
        btnText,
        link,
        isVisible,
        isDeleted,
        createDate,
        greetingsText,
        cancelBtnText,
        firstText
      ]);
}

NewSplashStruct createNewSplashStruct({
  String? image,
  String? text,
  String? title,
  String? btnText,
  String? link,
  bool? isVisible,
  bool? isDeleted,
  DateTime? createDate,
  String? greetingsText,
  String? cancelBtnText,
  String? firstText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewSplashStruct(
      image: image,
      text: text,
      title: title,
      btnText: btnText,
      link: link,
      isVisible: isVisible,
      isDeleted: isDeleted,
      createDate: createDate,
      greetingsText: greetingsText,
      cancelBtnText: cancelBtnText,
      firstText: firstText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewSplashStruct? updateNewSplashStruct(
  NewSplashStruct? newSplash, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newSplash
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewSplashStructData(
  Map<String, dynamic> firestoreData,
  NewSplashStruct? newSplash,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newSplash == null) {
    return;
  }
  if (newSplash.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newSplash.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newSplashData = getNewSplashFirestoreData(newSplash, forFieldValue);
  final nestedData = newSplashData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newSplash.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewSplashFirestoreData(
  NewSplashStruct? newSplash, [
  bool forFieldValue = false,
]) {
  if (newSplash == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newSplash.toMap());

  // Add any Firestore field values
  newSplash.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewSplashListFirestoreData(
  List<NewSplashStruct>? newSplashs,
) =>
    newSplashs?.map((e) => getNewSplashFirestoreData(e, true)).toList() ?? [];
