import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "is_paid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "is_visible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? false;
  bool hasIsVisible() => _isVisible != null;

  // "is_undeletable" field.
  bool? _isUndeletable;
  bool get isUndeletable => _isUndeletable ?? false;
  bool hasIsUndeletable() => _isUndeletable != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isPaid = snapshotData['is_paid'] as bool?;
    _tags = getDataList(snapshotData['tags']);
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _isVisible = snapshotData['is_visible'] as bool?;
    _isUndeletable = snapshotData['is_undeletable'] as bool?;
    _link = snapshotData['link'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? name,
  bool? isPaid,
  String? image,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? isVisible,
  bool? isUndeletable,
  String? link,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'is_paid': isPaid,
      'image': image,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'is_visible': isVisible,
      'is_undeletable': isUndeletable,
      'link': link,
      'is_deleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.isPaid == e2?.isPaid &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.isVisible == e2?.isVisible &&
        e1?.isUndeletable == e2?.isUndeletable &&
        e1?.link == e2?.link &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.isPaid,
        e?.tags,
        e?.image,
        e?.createdTime,
        e?.modifiedTime,
        e?.isVisible,
        e?.isUndeletable,
        e?.link,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
