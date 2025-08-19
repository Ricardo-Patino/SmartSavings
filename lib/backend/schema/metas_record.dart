import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetasRecord extends FirestoreRecord {
  MetasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "monto" field.
  int? _monto;
  int get monto => _monto ?? 0;
  bool hasMonto() => _monto != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "ownerID" field.
  String? _ownerID;
  String get ownerID => _ownerID ?? '';
  bool hasOwnerID() => _ownerID != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _monto = castToType<int>(snapshotData['monto']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _estado = snapshotData['estado'] as String?;
    _ownerID = snapshotData['ownerID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('metas');

  static Stream<MetasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MetasRecord.fromSnapshot(s));

  static Future<MetasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MetasRecord.fromSnapshot(s));

  static MetasRecord fromSnapshot(DocumentSnapshot snapshot) => MetasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MetasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MetasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MetasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MetasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMetasRecordData({
  String? nombre,
  int? monto,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? estado,
  String? ownerID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'monto': monto,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'estado': estado,
      'ownerID': ownerID,
    }.withoutNulls,
  );

  return firestoreData;
}

class MetasRecordDocumentEquality implements Equality<MetasRecord> {
  const MetasRecordDocumentEquality();

  @override
  bool equals(MetasRecord? e1, MetasRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.monto == e2?.monto &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.estado == e2?.estado &&
        e1?.ownerID == e2?.ownerID;
  }

  @override
  int hash(MetasRecord? e) => const ListEquality().hash(
      [e?.nombre, e?.monto, e?.createdAt, e?.updatedAt, e?.estado, e?.ownerID]);

  @override
  bool isValidKey(Object? o) => o is MetasRecord;
}
