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

  // "Tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "Owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "Color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _porcentaje = castToType<int>(snapshotData['Porcentaje']);
    _tipo = snapshotData['Tipo'] as String?;
    _owner = snapshotData['Owner'] as DocumentReference?;
    _color = snapshotData['Color'] as String?;
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
  String? tipo,
  DocumentReference? owner,
  String? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Porcentaje': porcentaje,
      'Tipo': tipo,
      'Owner': owner,
      'Color': color,
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
        e1?.tipo == e2?.tipo &&
        e1?.owner == e2?.owner &&
        e1?.color == e2?.color;
  }

  @override
  int hash(CategoriaRecord? e) => const ListEquality()
      .hash([e?.nombre, e?.porcentaje, e?.tipo, e?.owner, e?.color]);

  @override
  bool isValidKey(Object? o) => o is CategoriaRecord;
}
