import 'dart:developer';

import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/image_enum.dart';
import 'package:equatable/equatable.dart';
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

  List<ProductModel> productList = [
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
        content: 'Main proccessin unit updated and strengthened',
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
  ];

  void changeFavourite(int index) {
    changeLoading();
    inspect(state.productList);
    ProductModel newModel = productList[index].copyWith(isFavourite: !productList[index].isFavourite);
    productList[index] = newModel;
    inspect(newModel);
    emit(state.copyWith(productList: productList));
    inspect(state.productList);
    changeLoading();
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

class HomeStates extends Equatable {
  const HomeStates({required this.isLoading, required this.productList});
  final bool isLoading;
  final List<ProductModel> productList;

  HomeStates copyWith({bool? isLoading, List<ProductModel>? productList}) {
    return HomeStates(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object?> get props => [isLoading, productList];
}
