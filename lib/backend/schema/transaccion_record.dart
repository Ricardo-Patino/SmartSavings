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

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "categoria" field.
  DocumentReference? _categoria;
  DocumentReference? get categoria => _categoria;
  bool hasCategoria() => _categoria != null;

  void _initializeFields() {
    _monto = castToType<double>(snapshotData['monto']);
    _descripcion = snapshotData['descripcion'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _categoria = snapshotData['categoria'] as DocumentReference?;
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
  double? monto,
  String? descripcion,
  String? tipo,
  DocumentReference? owner,
  DocumentReference? categoria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'monto': monto,
      'descripcion': descripcion,
      'tipo': tipo,
      'owner': owner,
      'categoria': categoria,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransaccionRecordDocumentEquality implements Equality<TransaccionRecord> {
  const TransaccionRecordDocumentEquality();

  @override
  bool equals(TransaccionRecord? e1, TransaccionRecord? e2) {
    return e1?.monto == e2?.monto &&
        e1?.descripcion == e2?.descripcion &&
        e1?.tipo == e2?.tipo &&
        e1?.owner == e2?.owner &&
        e1?.categoria == e2?.categoria;
  }

  @override
  int hash(TransaccionRecord? e) => const ListEquality()
      .hash([e?.monto, e?.descripcion, e?.tipo, e?.owner, e?.categoria]);

  @override
  bool isValidKey(Object? o) => o is TransaccionRecord;
}
