import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/models/new_product_model.dart';
import 'package:e_commerce_app/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseViewModel extends Cubit<BaseStates> {
  BaseViewModel()
      : super(BaseStates(
          isLoading: false,
          productList: List.empty(),
          favouriteProductList: List.empty(),
          productListInBasket: List.empty(),
        ));

  final productCollectionReference = FirebaseCollections.product.reference;

  Future<void> fetchProducts() async {
    final response = await productCollectionReference
        .withConverter(
          fromFirestore: (snapshot, options) => ProductModel().fromFirebase(snapshot),
          toFirestore: (value, options) {
            return value.toJson();
          },
        )
        .orderBy(StringConstant.queryPrice, descending: true)
        .get();

    if (response.docs.isNotEmpty) {
      final productList = response.docs.map((e) => e.data()).toList();
      final favouriteProductList = productList.where((x) => x.isFavourite == true).toList();
      emit(state.copyWith(productList: productList, favouriteProductList: favouriteProductList));
    }
  }

  Future<void> fetchProductsAndLoad() async {
    changeLoading();
    await fetchProducts();
    changeLoading();
  }

  void addProductIntoBasket(ProductModel model) {
    if (model.id == null || model.id!.isEmpty) return;
    List<ProductModel> liste;
    if (state.productListInBasket.isNotEmpty) {
      liste = state.productListInBasket;
      liste.add(model);
    } else {
      liste = [model];
    }
    emit(state.copyWith(productListInBasket: liste));
  }

  void minusProductFromBasket(ProductModel model) {
    if (model.id == null || model.id!.isEmpty) return;
    List<ProductModel> productListInBasket = state.productListInBasket;
    productListInBasket.remove(model);
    emit(state.copyWith(productListInBasket: productListInBasket));
  }

  Future<void> changeFavourite(String id) async {
    List<ProductModel> favouriteProductList;
    ProductModel? model = state.productList.where((x) => x.id == id).singleOrNull;
    if (model == null) {
      return;
    }

    ProductModel newModel = model.copyWith(isFavourite: !model.isFavourite);

    await productCollectionReference.doc(id).update({
      "id": newModel.id,
      "name": newModel.name,
      "content": newModel.content,
      "imagePath": newModel.imagePath,
      "price": newModel.price,
      "isFavourite": newModel.isFavourite,
    });

    if (state.favouriteProductList.contains(model)) {
      favouriteProductList = state.favouriteProductList;
      favouriteProductList.remove(model);
    } else if (state.favouriteProductList.isEmpty) {
      favouriteProductList = [newModel];
    } else {
      favouriteProductList = state.favouriteProductList;
      favouriteProductList.add(newModel);
    }
    emit(state.copyWith(favouriteProductList: favouriteProductList));
  }

  Future<void> changeFavouriteAndFetchProducts(String id) async {
    changeLoading();
    await changeFavourite(id);
    await fetchProducts();
    changeLoading();
  }

  String calculateTotalPrice() {
    if (state.productListInBasket.isEmpty) return 0.toString();
    int totalPrice = 0;
    for (var product in state.productListInBasket) {
      totalPrice = totalPrice + product.price!.toInt();
    }
    return totalPrice.toString();
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

class BaseStates {
  const BaseStates(
      {required this.isLoading,
      required this.productList,
      required this.favouriteProductList,
      required this.productListInBasket});
  final bool isLoading;
  final List<ProductModel> productList;
  final List<ProductModel> favouriteProductList;
  final List<ProductModel> productListInBasket;

  BaseStates copyWith(
      {bool? isLoading,
      List<ProductModel>? productList,
      List<ProductModel>? favouriteProductList,
      List<ProductModel>? productListInBasket}) {
    return BaseStates(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      favouriteProductList: favouriteProductList ?? this.favouriteProductList,
      productListInBasket: productListInBasket ?? this.productListInBasket,
    );
  }
}

// void changeFavourite(String id) {
  //   List<ProductModel> list = state.productList;
  //   ProductModel? model = list.where((x) => x.id == id).singleOrNull;
  //   if (model == null) return;
  //   ProductModel newModel = model.copyWith(isFavourite: !model.isFavourite);
  //   int index = list.indexWhere((x) => x.id == id);
  //   list[index] = newModel;
  //   emit(state.copyWith(productList: list));
  // }

 //  productList: [
  //     ProductModel(
  //         id: '0',
  //         name: 'Iphone 15',
  //         content: 'Latest advanced camera.',
  //         price: 50000,
  //         imagePath: ImageEnum.iphone_15.toPath),
  //     ProductModel(
  //         id: '1',
  //         name: 'Iphone 14',
  //         content: 'Battery improvements hava been made.',
  //         price: 40000,
  //         imagePath: ImageEnum.iphone_14.toPath),
  //     ProductModel(
  //         id: '2',
  //         name: 'Iphone 13',
  //         content: 'screen design has been renewed.',
  //         price: 35000,
  //         imagePath: ImageEnum.iphone_13.toPath),
  //     ProductModel(
  //         id: '3',
  //         name: 'Iphone 11',
  //         content: 'Main proccessin unit updated and strengthened.',
  //         price: 25000,
  //         imagePath: ImageEnum.iphone_11.toPath),
  //     ProductModel(
  //         id: '4',
  //         name: 'Iphone X',
  //         content: 'The fingerprint reader was removed and replaced with face ID.',
  //         price: 17500,
  //         imagePath: ImageEnum.iphone_x.toPath),
  //     ProductModel(
  //         id: '5',
  //         name: 'Iphone 8',
  //         content: 'Compact design functional use',
  //         price: 10000,
  //         imagePath: ImageEnum.iphone_8.toPath),
  //         ProductModel(),
  //   ]


 // Future<void> fetchFavouriteProductsAndLoad() async {
  //   changeLoading();
  //   await fetchFavouriteProducts();
  //   changeLoading();
  // }

  // Future<void> fetchFavouriteProducts() async {
  //   final response = await productCollectionReference
  //       .where(StringConstant.queryIsFavoruite, isEqualTo: true)
  //       .withConverter(
  //         fromFirestore: (snapshot, options) => ProductModel().fromFirebase(snapshot),
  //         toFirestore: (value, options) {
  //           return value.toJson();
  //         },
  //       )
  //       .get();

  //   if (response.docs.isNotEmpty) {
  //     final favouriteProductList = response.docs.map((e) => e.data()).toList();
  //     emit(state.copyWith(favouriteProductList: favouriteProductList));
  //   }
  // }