import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StoriesRecord extends FirestoreRecord {
  StoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  bool hasIsVisible() => _isVisible != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "button_text" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  bool hasButtonText() => _buttonText != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

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

  // "cover_image" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  bool hasCoverImage() => _coverImage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isVisible = snapshotData['is_visible'] as bool?;
    _image = snapshotData['image'] as String?;
    _buttonText = snapshotData['button_text'] as String?;
    _link = snapshotData['link'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _coverImage = snapshotData['cover_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stories');

  static Stream<StoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoriesRecord.fromSnapshot(s));

  static Future<StoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoriesRecord.fromSnapshot(s));

  static StoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoriesRecordData({
  String? name,
  bool? isVisible,
  String? image,
  String? buttonText,
  String? link,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? isDeleted,
  String? coverImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'is_visible': isVisible,
      'image': image,
      'button_text': buttonText,
      'link': link,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'is_deleted': isDeleted,
      'cover_image': coverImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoriesRecordDocumentEquality implements Equality<StoriesRecord> {
  const StoriesRecordDocumentEquality();

  @override
  bool equals(StoriesRecord? e1, StoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.isVisible == e2?.isVisible &&
        e1?.image == e2?.image &&
        e1?.buttonText == e2?.buttonText &&
        e1?.link == e2?.link &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.coverImage == e2?.coverImage;
  }

  @override
  int hash(StoriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.isVisible,
        e?.image,
        e?.buttonText,
        e?.link,
        e?.createdTime,
        e?.modifiedTime,
        e?.isDeleted,
        e?.coverImage
      ]);

  @override
  bool isValidKey(Object? o) => o is StoriesRecord;
}
