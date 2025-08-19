import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriaRecord extends FirestoreRecord {
  CategoriaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Porcentaje" field.
  int? _porcentaje;
  int get porcentaje => _porcentaje ?? 0;
  bool hasPorcentaje() => _porcentaje != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "Color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  bool hasOwnerId() => _ownerId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _porcentaje = castToType<int>(snapshotData['Porcentaje']);
    _owner = snapshotData['Owner'] as DocumentReference?;
    _color = snapshotData['Color'] as String?;
    _ownerId = snapshotData['ownerId'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categoria');

  static Stream<CategoriaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriaRecord.fromSnapshot(s));

  static Future<CategoriaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriaRecord.fromSnapshot(s));

  static CategoriaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriaRecordData({
  String? nombre,
  int? porcentaje,
  DocumentReference? owner,
  String? color,
  String? ownerId,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Porcentaje': porcentaje,
      'Owner': owner,
      'Color': color,
      'ownerId': ownerId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriaRecordDocumentEquality implements Equality<CategoriaRecord> {
  const CategoriaRecordDocumentEquality();

  @override
  bool equals(CategoriaRecord? e1, CategoriaRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.porcentaje == e2?.porcentaje &&
        e1?.owner == e2?.owner &&
        e1?.color == e2?.color &&
        e1?.ownerId == e2?.ownerId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt;
  }

  @override
  int hash(CategoriaRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.porcentaje,
        e?.owner,
        e?.color,
        e?.ownerId,
        e?.createdAt,
        e?.updatedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriaRecord;
}
