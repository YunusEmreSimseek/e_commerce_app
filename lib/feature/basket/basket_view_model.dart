// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketViewModel extends Cubit<BasketStates> {
  BasketViewModel() : super(const BasketStates());

  void addProductIntoBasket(ProductModel product) {
    List<ProductModel> productList = [];
    if (state.productList == null || state.productList!.isEmpty) {
      productList.add(product);
      emit(state.copyWith(productList: productList));
      inspect(state.productList);
    } else {
      productList = state.productList!;
      productList.add(product);
      emit(state.copyWith(productList: productList));
      inspect(state.productList);
    }
  }

  void takeProductFromBasket(ProductModel product) {
    List<ProductModel> productList = [];
    if (state.productList == null || state.productList!.isEmpty) {
      emit(state.copyWith(productList: null));
      inspect(state.productList);
      print('liste null mı : ${state.productList == null}');
      if (state.productList != null) {
        print('liste boş mu : ${state.productList!.isEmpty}');
      }
      print('liste ne : ${state.productList}');
    } else {
      productList = state.productList!;
      productList.removeWhere((x) => x.id == product.id);
      emit(state.copyWith(productList: productList));
      inspect(state.productList);
    }
  }

  String calculateTotalPrice() {
    if (state.productList == null) return 0.toString();
    int totalPrice = 0;
    for (var product in state.productList!) {
      totalPrice = totalPrice + product.price;
    }
    return totalPrice.toString();
  }
}

class BasketStates extends Equatable {
  const BasketStates({this.productList, this.totalPrice});
  final List<ProductModel>? productList;
  final int? totalPrice;

  BasketStates copyWith({
    List<ProductModel>? productList,
    int? totalPrice,
  }) {
    return BasketStates(
      productList: productList ?? this.productList,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [productList, totalPrice];
}
