import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter/flutter_util.dart';

class CaregiverRecord extends FirestoreRecord {
  CaregiverRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "caregiverName" field.
  String? _caregiverName;
  String get caregiverName => _caregiverName ?? '';
  bool hasCaregiverName() => _caregiverName != null;

  // "photoURL" field.
  String? _photoURL;
  String get photoURL => _photoURL ?? '';
  bool hasPhotoURL() => _photoURL != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "zipCode" field.
  int? _zipCode;
  int get zipCode => _zipCode ?? 0;
  bool hasZipCode() => _zipCode != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "descLong" field.
  String? _descLong;
  String get descLong => _descLong ?? '';
  bool hasDescLong() => _descLong != null;

  // "descShort" field.
  String? _descShort;
  String get descShort => _descShort ?? '';
  bool hasDescShort() => _descShort != null;

  // "serviceRef" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _caregiverName = snapshotData['caregiverName'] as String?;
    _photoURL = snapshotData['photoURL'] as String?;
    _adress = snapshotData['adress'] as String?;
    _zipCode = castToType<int>(snapshotData['zipCode']);
    _rating = castToType<double>(snapshotData['rating']);
    _phone = snapshotData['phone'] as String?;
    _descLong = snapshotData['descLong'] as String?;
    _descShort = snapshotData['descShort'] as String?;
    _serviceRef = snapshotData['serviceRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('caregiver')
          : FirebaseFirestore.instance.collectionGroup('caregiver');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('caregiver').doc();

  static Stream<CaregiverRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CaregiverRecord.fromSnapshot(s));

  static Future<CaregiverRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CaregiverRecord.fromSnapshot(s));

  static CaregiverRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CaregiverRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CaregiverRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CaregiverRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CaregiverRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CaregiverRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCaregiverRecordData({
  String? caregiverName,
  String? photoURL,
  String? adress,
  int? zipCode,
  double? rating,
  String? phone,
  String? descLong,
  String? descShort,
  DocumentReference? serviceRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'caregiverName': caregiverName,
      'photoURL': photoURL,
      'adress': adress,
      'zipCode': zipCode,
      'rating': rating,
      'phone': phone,
      'descLong': descLong,
      'descShort': descShort,
      'serviceRef': serviceRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CaregiverRecordDocumentEquality implements Equality<CaregiverRecord> {
  const CaregiverRecordDocumentEquality();

  @override
  bool equals(CaregiverRecord? e1, CaregiverRecord? e2) {
    return e1?.caregiverName == e2?.caregiverName &&
        e1?.photoURL == e2?.photoURL &&
        e1?.adress == e2?.adress &&
        e1?.zipCode == e2?.zipCode &&
        e1?.rating == e2?.rating &&
        e1?.phone == e2?.phone &&
        e1?.descLong == e2?.descLong &&
        e1?.descShort == e2?.descShort &&
        e1?.serviceRef == e2?.serviceRef;
  }

  @override
  int hash(CaregiverRecord? e) => const ListEquality().hash([
        e?.caregiverName,
        e?.photoURL,
        e?.adress,
        e?.zipCode,
        e?.rating,
        e?.phone,
        e?.descLong,
        e?.descShort,
        e?.serviceRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CaregiverRecord;
}
