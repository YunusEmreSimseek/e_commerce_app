import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  product,
  ;

  CollectionReference get reference => FirebaseFirestore.instance.collection(name);
}
