import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewSplashsRecord extends FirestoreRecord {
  NewSplashsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "btn_text" field.
  String? _btnText;
  String get btnText => _btnText ?? '';
  bool hasBtnText() => _btnText != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  bool hasIsVisible() => _isVisible != null;

  // "greetings_text" field.
  String? _greetingsText;
  String get greetingsText => _greetingsText ?? '';
  bool hasGreetingsText() => _greetingsText != null;

  // "first_text" field.
  String? _firstText;
  String get firstText => _firstText ?? '';
  bool hasFirstText() => _firstText != null;

  // "cancel_btn_text" field.
  String? _cancelBtnText;
  String get cancelBtnText => _cancelBtnText ?? '';
  bool hasCancelBtnText() => _cancelBtnText != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _title = snapshotData['title'] as String?;
    _link = snapshotData['link'] as String?;
    _btnText = snapshotData['btn_text'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _createDate = snapshotData['create_date'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _isVisible = snapshotData['is_visible'] as bool?;
    _greetingsText = snapshotData['greetings_text'] as String?;
    _firstText = snapshotData['first_text'] as String?;
    _cancelBtnText = snapshotData['cancel_btn_text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('new_splashs');

  static Stream<NewSplashsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewSplashsRecord.fromSnapshot(s));

  static Future<NewSplashsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewSplashsRecord.fromSnapshot(s));

  static NewSplashsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewSplashsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewSplashsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewSplashsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewSplashsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewSplashsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewSplashsRecordData({
  String? text,
  String? title,
  String? link,
  String? btnText,
  bool? isDeleted,
  DateTime? createDate,
  String? image,
  bool? isVisible,
  String? greetingsText,
  String? firstText,
  String? cancelBtnText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'title': title,
      'link': link,
      'btn_text': btnText,
      'is_deleted': isDeleted,
      'create_date': createDate,
      'image': image,
      'is_visible': isVisible,
      'greetings_text': greetingsText,
      'first_text': firstText,
      'cancel_btn_text': cancelBtnText,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewSplashsRecordDocumentEquality implements Equality<NewSplashsRecord> {
  const NewSplashsRecordDocumentEquality();

  @override
  bool equals(NewSplashsRecord? e1, NewSplashsRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.title == e2?.title &&
        e1?.link == e2?.link &&
        e1?.btnText == e2?.btnText &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.createDate == e2?.createDate &&
        e1?.image == e2?.image &&
        e1?.isVisible == e2?.isVisible &&
        e1?.greetingsText == e2?.greetingsText &&
        e1?.firstText == e2?.firstText &&
        e1?.cancelBtnText == e2?.cancelBtnText;
  }

  @override
  int hash(NewSplashsRecord? e) => const ListEquality().hash([
        e?.text,
        e?.title,
        e?.link,
        e?.btnText,
        e?.isDeleted,
        e?.createDate,
        e?.image,
        e?.isVisible,
        e?.greetingsText,
        e?.firstText,
        e?.cancelBtnText
      ]);

  @override
  bool isValidKey(Object? o) => o is NewSplashsRecord;
}
