import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PresupuestoRecord extends FirestoreRecord {
  PresupuestoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ownerID" field.
  String? _ownerID;
  String get ownerID => _ownerID ?? '';
  bool hasOwnerID() => _ownerID != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "periodo" field.
  String? _periodo;
  String get periodo => _periodo ?? '';
  bool hasPeriodo() => _periodo != null;

  // "limte" field.
  int? _limte;
  int get limte => _limte ?? 0;
  bool hasLimte() => _limte != null;

  // "createdAT" field.
  DateTime? _createdAT;
  DateTime? get createdAT => _createdAT;
  bool hasCreatedAT() => _createdAT != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "moneda" field.
  String? _moneda;
  String get moneda => _moneda ?? '';
  bool hasMoneda() => _moneda != null;

  // "actual" field.
  int? _actual;
  int get actual => _actual ?? 0;
  bool hasActual() => _actual != null;

  // "categoriaRef" field.
  DocumentReference? _categoriaRef;
  DocumentReference? get categoriaRef => _categoriaRef;
  bool hasCategoriaRef() => _categoriaRef != null;

  void _initializeFields() {
    _ownerID = snapshotData['ownerID'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _periodo = snapshotData['periodo'] as String?;
    _limte = castToType<int>(snapshotData['limte']);
    _createdAT = snapshotData['createdAT'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _categoria = snapshotData['categoria'] as String?;
    _moneda = snapshotData['moneda'] as String?;
    _actual = castToType<int>(snapshotData['actual']);
    _categoriaRef = snapshotData['categoriaRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('presupuesto');

  static Stream<PresupuestoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PresupuestoRecord.fromSnapshot(s));

  static Future<PresupuestoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PresupuestoRecord.fromSnapshot(s));

  static PresupuestoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PresupuestoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PresupuestoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PresupuestoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PresupuestoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PresupuestoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPresupuestoRecordData({
  String? ownerID,
  DocumentReference? owner,
  String? periodo,
  int? limte,
  DateTime? createdAT,
  DateTime? updatedAt,
  String? categoria,
  String? moneda,
  int? actual,
  DocumentReference? categoriaRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ownerID': ownerID,
      'owner': owner,
      'periodo': periodo,
      'limte': limte,
      'createdAT': createdAT,
      'updatedAt': updatedAt,
      'categoria': categoria,
      'moneda': moneda,
      'actual': actual,
      'categoriaRef': categoriaRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class PresupuestoRecordDocumentEquality implements Equality<PresupuestoRecord> {
  const PresupuestoRecordDocumentEquality();

  @override
  bool equals(PresupuestoRecord? e1, PresupuestoRecord? e2) {
    return e1?.ownerID == e2?.ownerID &&
        e1?.owner == e2?.owner &&
        e1?.periodo == e2?.periodo &&
        e1?.limte == e2?.limte &&
        e1?.createdAT == e2?.createdAT &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.categoria == e2?.categoria &&
        e1?.moneda == e2?.moneda &&
        e1?.actual == e2?.actual &&
        e1?.categoriaRef == e2?.categoriaRef;
  }

  @override
  int hash(PresupuestoRecord? e) => const ListEquality().hash([
        e?.ownerID,
        e?.owner,
        e?.periodo,
        e?.limte,
        e?.createdAT,
        e?.updatedAt,
        e?.categoria,
        e?.moneda,
        e?.actual,
        e?.categoriaRef
      ]);

  @override
  bool isValidKey(Object? o) => o is PresupuestoRecord;
}
