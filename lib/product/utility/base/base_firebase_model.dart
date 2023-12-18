import 'package:cloud_firestore/cloud_firestore.dart';

abstract mixin class IdModel {
  String? get id;
}

abstract mixin class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);
  // T copyWith();
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      //throw FirebaseCustomException(description: '$snapshot data is null');
      throw Exception();
    }
    // fixme
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
