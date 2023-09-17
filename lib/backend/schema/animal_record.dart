import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter/flutter_util.dart';

class AnimalRecord extends FirestoreRecord {
  AnimalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "species" field.
  String? _species;
  String get species => _species ?? '';
  bool hasSpecies() => _species != null;

  // "breed" field.
  String? _breed;
  String get breed => _breed ?? '';
  bool hasBreed() => _breed != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "obs" field.
  String? _obs;
  String get obs => _obs ?? '';
  bool hasObs() => _obs != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _species = snapshotData['species'] as String?;
    _breed = snapshotData['breed'] as String?;
    _gender = snapshotData['gender'] as String?;
    _obs = snapshotData['obs'] as String?;
    _photo = snapshotData['photo'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('animal');

  static Stream<AnimalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnimalRecord.fromSnapshot(s));

  static Future<AnimalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnimalRecord.fromSnapshot(s));

  static AnimalRecord fromSnapshot(DocumentSnapshot snapshot) => AnimalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnimalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnimalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnimalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnimalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnimalRecordData({
  String? name,
  int? age,
  String? species,
  String? breed,
  String? gender,
  String? obs,
  String? photo,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
      'species': species,
      'breed': breed,
      'gender': gender,
      'obs': obs,
      'photo': photo,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnimalRecordDocumentEquality implements Equality<AnimalRecord> {
  const AnimalRecordDocumentEquality();

  @override
  bool equals(AnimalRecord? e1, AnimalRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.species == e2?.species &&
        e1?.breed == e2?.breed &&
        e1?.gender == e2?.gender &&
        e1?.obs == e2?.obs &&
        e1?.photo == e2?.photo &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(AnimalRecord? e) => const ListEquality().hash([
        e?.name,
        e?.age,
        e?.species,
        e?.breed,
        e?.gender,
        e?.obs,
        e?.photo,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is AnimalRecord;
}
