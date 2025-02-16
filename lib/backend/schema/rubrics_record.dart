import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RubricsRecord extends FirestoreRecord {
  RubricsRecord._(
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

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "articles_refs" field.
  List<DocumentReference>? _articlesRefs;
  List<DocumentReference> get articlesRefs => _articlesRefs ?? const [];
  bool hasArticlesRefs() => _articlesRefs != null;

  // "icon" field.
  FeedCardIcon? _icon;
  FeedCardIcon? get icon => _icon;
  bool hasIcon() => _icon != null;

  // "editor" field.
  Editor? _editor;
  Editor? get editor => _editor;
  bool hasEditor() => _editor != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  bool hasBanner() => _banner != null;

  // "icon_image" field.
  String? _iconImage;
  String get iconImage => _iconImage ?? '';
  bool hasIconImage() => _iconImage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isVisible = snapshotData['is_visible'] as bool?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _articlesRefs = getDataList(snapshotData['articles_refs']);
    _icon = snapshotData['icon'] is FeedCardIcon
        ? snapshotData['icon']
        : deserializeEnum<FeedCardIcon>(snapshotData['icon']);
    _editor = snapshotData['editor'] is Editor
        ? snapshotData['editor']
        : deserializeEnum<Editor>(snapshotData['editor']);
    _banner = snapshotData['banner'] as String?;
    _iconImage = snapshotData['icon_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rubrics');

  static Stream<RubricsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RubricsRecord.fromSnapshot(s));

  static Future<RubricsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RubricsRecord.fromSnapshot(s));

  static RubricsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RubricsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RubricsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RubricsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RubricsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RubricsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRubricsRecordData({
  String? name,
  bool? isVisible,
  bool? isDeleted,
  DateTime? createdTime,
  DateTime? modifiedTime,
  FeedCardIcon? icon,
  Editor? editor,
  String? banner,
  String? iconImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'is_visible': isVisible,
      'is_deleted': isDeleted,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'icon': icon,
      'editor': editor,
      'banner': banner,
      'icon_image': iconImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class RubricsRecordDocumentEquality implements Equality<RubricsRecord> {
  const RubricsRecordDocumentEquality();

  @override
  bool equals(RubricsRecord? e1, RubricsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.isVisible == e2?.isVisible &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        listEquality.equals(e1?.articlesRefs, e2?.articlesRefs) &&
        e1?.icon == e2?.icon &&
        e1?.editor == e2?.editor &&
        e1?.banner == e2?.banner &&
        e1?.iconImage == e2?.iconImage;
  }

  @override
  int hash(RubricsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.isVisible,
        e?.isDeleted,
        e?.createdTime,
        e?.modifiedTime,
        e?.articlesRefs,
        e?.icon,
        e?.editor,
        e?.banner,
        e?.iconImage
      ]);

  @override
  bool isValidKey(Object? o) => o is RubricsRecord;
}
