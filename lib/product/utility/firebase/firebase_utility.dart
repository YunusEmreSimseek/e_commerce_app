import 'package:e_commerce_app/product/utility/base/base_firebase_model.dart';
import 'package:e_commerce_app/product/utility/firebase/firebase_collections.dart';

mixin FirebaseUtility {
  Future<List<T>?> fetchList<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R data,
    FirebaseCollections collections,
  ) async {
    final collection = collections.reference;
    final response = await collection
        .withConverter<T>(
          fromFirestore: (snapshot, options) => data.fromFirebase(snapshot),
          toFirestore: (value, options) => {},
        )
        .get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
