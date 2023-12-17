import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/image_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel()
      : super(HomeStates(isLoading: false, productList: [
          ProductModel(
              id: 0,
              name: 'Iphone 15',
              content: 'Latest advanced camera.',
              price: 50000,
              imagePath: ImageEnum.iphone_15.toPath),
          ProductModel(
              id: 1,
              name: 'Iphone 14',
              content: 'Battery improvements hava been made.',
              price: 40000,
              imagePath: ImageEnum.iphone_14.toPath),
          ProductModel(
              id: 2,
              name: 'Iphone 13',
              content: 'screen design has been renewed.',
              price: 35000,
              imagePath: ImageEnum.iphone_13.toPath),
          ProductModel(
              id: 3,
              name: 'Iphone 11',
              content: 'Main proccessin unit updated and strengthened.',
              price: 25000,
              imagePath: ImageEnum.iphone_11.toPath),
          ProductModel(
              id: 4,
              name: 'Iphone X',
              content: 'The fingerprint reader was removed and replaced with face ID.',
              price: 17500,
              imagePath: ImageEnum.iphone_x.toPath),
          ProductModel(
              id: 5,
              name: 'Iphone 8',
              content: 'Compact design functional use',
              price: 10000,
              imagePath: ImageEnum.iphone_8.toPath),
        ]));

  void changeFavourite(int id) {
    List<ProductModel> list = state.productList;
    ProductModel? model = list.where((x) => x.id == id).singleOrNull;
    if (model == null) return;
    ProductModel newModel = model.copyWith(isFavourite: !model.isFavourite);
    int index = list.indexWhere((x) => x.id == id);
    list[index] = newModel;
    emit(state.copyWith(productList: list));
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

class HomeStates {
  const HomeStates({required this.isLoading, required this.productList});
  final bool isLoading;
  final List<ProductModel> productList;

  HomeStates copyWith({bool? isLoading, List<ProductModel>? productList}) {
    return HomeStates(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
    );
  }
}
