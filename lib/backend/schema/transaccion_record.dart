import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransaccionRecord extends FirestoreRecord {
  TransaccionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "ownerID" field.
  String? _ownerID;
  String get ownerID => _ownerID ?? '';
  bool hasOwnerID() => _ownerID != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "moneda" field.
  String? _moneda;
  String get moneda => _moneda ?? '';
  bool hasMoneda() => _moneda != null;

  // "metodoPago" field.
  String? _metodoPago;
  String get metodoPago => _metodoPago ?? '';
  bool hasMetodoPago() => _metodoPago != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "monto" field.
  int? _monto;
  int get monto => _monto ?? 0;
  bool hasMonto() => _monto != null;

  // "periodDate" field.
  String? _periodDate;
  String get periodDate => _periodDate ?? '';
  bool hasPeriodDate() => _periodDate != null;

  void _initializeFields() {
    _descripcion = snapshotData['descripcion'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _tipo = snapshotData['tipo'] as String?;
    _ownerID = snapshotData['ownerID'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _moneda = snapshotData['moneda'] as String?;
    _metodoPago = snapshotData['metodoPago'] as String?;
    _estado = snapshotData['estado'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _monto = castToType<int>(snapshotData['monto']);
    _periodDate = snapshotData['periodDate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaccion');

  static Stream<TransaccionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransaccionRecord.fromSnapshot(s));

  static Future<TransaccionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransaccionRecord.fromSnapshot(s));

  static TransaccionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransaccionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransaccionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransaccionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransaccionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransaccionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransaccionRecordData({
  String? descripcion,
  DocumentReference? owner,
  String? tipo,
  String? ownerID,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? moneda,
  String? metodoPago,
  String? estado,
  String? categoria,
  int? monto,
  String? periodDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'descripcion': descripcion,
      'owner': owner,
      'tipo': tipo,
      'ownerID': ownerID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'moneda': moneda,
      'metodoPago': metodoPago,
      'estado': estado,
      'categoria': categoria,
      'monto': monto,
      'periodDate': periodDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransaccionRecordDocumentEquality implements Equality<TransaccionRecord> {
  const TransaccionRecordDocumentEquality();

  @override
  bool equals(TransaccionRecord? e1, TransaccionRecord? e2) {
    return e1?.descripcion == e2?.descripcion &&
        e1?.owner == e2?.owner &&
        e1?.tipo == e2?.tipo &&
        e1?.ownerID == e2?.ownerID &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.moneda == e2?.moneda &&
        e1?.metodoPago == e2?.metodoPago &&
        e1?.estado == e2?.estado &&
        e1?.categoria == e2?.categoria &&
        e1?.monto == e2?.monto &&
        e1?.periodDate == e2?.periodDate;
  }

  @override
  int hash(TransaccionRecord? e) => const ListEquality().hash([
        e?.descripcion,
        e?.owner,
        e?.tipo,
        e?.ownerID,
        e?.createdAt,
        e?.updatedAt,
        e?.moneda,
        e?.metodoPago,
        e?.estado,
        e?.categoria,
        e?.monto,
        e?.periodDate
      ]);

  @override
  bool isValidKey(Object? o) => o is TransaccionRecord;
}
