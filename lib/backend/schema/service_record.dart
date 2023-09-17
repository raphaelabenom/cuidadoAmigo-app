import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter/flutter_util.dart';

class ServiceRecord extends FirestoreRecord {
  ServiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "desc" field.
  String? _desc;
  String get desc => _desc ?? '';
  bool hasDesc() => _desc != null;

  // "dtStart" field.
  DateTime? _dtStart;
  DateTime? get dtStart => _dtStart;
  bool hasDtStart() => _dtStart != null;

  // "dtEnd" field.
  DateTime? _dtEnd;
  DateTime? get dtEnd => _dtEnd;
  bool hasDtEnd() => _dtEnd != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "serviceName" field.
  String? _serviceName;
  String get serviceName => _serviceName ?? '';
  bool hasServiceName() => _serviceName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _desc = snapshotData['desc'] as String?;
    _dtStart = snapshotData['dtStart'] as DateTime?;
    _dtEnd = snapshotData['dtEnd'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _serviceName = snapshotData['serviceName'] as String?;
    _status = snapshotData['status'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service');

  static Stream<ServiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceRecord.fromSnapshot(s));

  static Future<ServiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceRecord.fromSnapshot(s));

  static ServiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceRecordData({
  String? desc,
  DateTime? dtStart,
  DateTime? dtEnd,
  double? price,
  String? serviceName,
  String? status,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'desc': desc,
      'dtStart': dtStart,
      'dtEnd': dtEnd,
      'price': price,
      'serviceName': serviceName,
      'status': status,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceRecordDocumentEquality implements Equality<ServiceRecord> {
  const ServiceRecordDocumentEquality();

  @override
  bool equals(ServiceRecord? e1, ServiceRecord? e2) {
    return e1?.desc == e2?.desc &&
        e1?.dtStart == e2?.dtStart &&
        e1?.dtEnd == e2?.dtEnd &&
        e1?.price == e2?.price &&
        e1?.serviceName == e2?.serviceName &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(ServiceRecord? e) => const ListEquality().hash([
        e?.desc,
        e?.dtStart,
        e?.dtEnd,
        e?.price,
        e?.serviceName,
        e?.status,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceRecord;
}
