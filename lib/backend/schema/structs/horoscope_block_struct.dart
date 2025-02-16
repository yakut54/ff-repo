// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HoroscopeBlockStruct extends FFFirebaseStruct {
  HoroscopeBlockStruct({
    Zodiac? zodiac,
    String? title,
    String? forMen,
    String? forWomen,
    String? advice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _zodiac = zodiac,
        _title = title,
        _forMen = forMen,
        _forWomen = forWomen,
        _advice = advice,
        super(firestoreUtilData);

  // "zodiac" field.
  Zodiac? _zodiac;
  Zodiac? get zodiac => _zodiac;
  set zodiac(Zodiac? val) => _zodiac = val;

  bool hasZodiac() => _zodiac != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "for_men" field.
  String? _forMen;
  String get forMen => _forMen ?? '';
  set forMen(String? val) => _forMen = val;

  bool hasForMen() => _forMen != null;

  // "for_women" field.
  String? _forWomen;
  String get forWomen => _forWomen ?? '';
  set forWomen(String? val) => _forWomen = val;

  bool hasForWomen() => _forWomen != null;

  // "advice" field.
  String? _advice;
  String get advice => _advice ?? '';
  set advice(String? val) => _advice = val;

  bool hasAdvice() => _advice != null;

  static HoroscopeBlockStruct fromMap(Map<String, dynamic> data) =>
      HoroscopeBlockStruct(
        zodiac: data['zodiac'] is Zodiac
            ? data['zodiac']
            : deserializeEnum<Zodiac>(data['zodiac']),
        title: data['title'] as String?,
        forMen: data['for_men'] as String?,
        forWomen: data['for_women'] as String?,
        advice: data['advice'] as String?,
      );

  static HoroscopeBlockStruct? maybeFromMap(dynamic data) => data is Map
      ? HoroscopeBlockStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'zodiac': _zodiac?.serialize(),
        'title': _title,
        'for_men': _forMen,
        'for_women': _forWomen,
        'advice': _advice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'zodiac': serializeParam(
          _zodiac,
          ParamType.Enum,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'for_men': serializeParam(
          _forMen,
          ParamType.String,
        ),
        'for_women': serializeParam(
          _forWomen,
          ParamType.String,
        ),
        'advice': serializeParam(
          _advice,
          ParamType.String,
        ),
      }.withoutNulls;

  static HoroscopeBlockStruct fromSerializableMap(Map<String, dynamic> data) =>
      HoroscopeBlockStruct(
        zodiac: deserializeParam<Zodiac>(
          data['zodiac'],
          ParamType.Enum,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        forMen: deserializeParam(
          data['for_men'],
          ParamType.String,
          false,
        ),
        forWomen: deserializeParam(
          data['for_women'],
          ParamType.String,
          false,
        ),
        advice: deserializeParam(
          data['advice'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HoroscopeBlockStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HoroscopeBlockStruct &&
        zodiac == other.zodiac &&
        title == other.title &&
        forMen == other.forMen &&
        forWomen == other.forWomen &&
        advice == other.advice;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([zodiac, title, forMen, forWomen, advice]);
}

HoroscopeBlockStruct createHoroscopeBlockStruct({
  Zodiac? zodiac,
  String? title,
  String? forMen,
  String? forWomen,
  String? advice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HoroscopeBlockStruct(
      zodiac: zodiac,
      title: title,
      forMen: forMen,
      forWomen: forWomen,
      advice: advice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HoroscopeBlockStruct? updateHoroscopeBlockStruct(
  HoroscopeBlockStruct? horoscopeBlock, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    horoscopeBlock
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHoroscopeBlockStructData(
  Map<String, dynamic> firestoreData,
  HoroscopeBlockStruct? horoscopeBlock,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (horoscopeBlock == null) {
    return;
  }
  if (horoscopeBlock.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && horoscopeBlock.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final horoscopeBlockData =
      getHoroscopeBlockFirestoreData(horoscopeBlock, forFieldValue);
  final nestedData =
      horoscopeBlockData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = horoscopeBlock.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHoroscopeBlockFirestoreData(
  HoroscopeBlockStruct? horoscopeBlock, [
  bool forFieldValue = false,
]) {
  if (horoscopeBlock == null) {
    return {};
  }
  final firestoreData = mapToFirestore(horoscopeBlock.toMap());

  // Add any Firestore field values
  horoscopeBlock.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHoroscopeBlockListFirestoreData(
  List<HoroscopeBlockStruct>? horoscopeBlocks,
) =>
    horoscopeBlocks
        ?.map((e) => getHoroscopeBlockFirestoreData(e, true))
        .toList() ??
    [];
