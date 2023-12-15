import 'package:e_commerce_app/feature/basket/basket_view.dart';
import 'package:e_commerce_app/feature/favourite/favorite_view.dart';
import 'package:e_commerce_app/feature/home/home_view.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarViewModel extends Cubit<BottomNavBarStates> {
  BottomNavBarViewModel() : super(BottomNavBarStates(currentIndex: 0));

  void changeCurrentIndex(int value) {
    emit(state.copyWith(currentIndex: value));
  }

  Widget decisionBody() {
    switch (state.currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const FavouriteView();
      case 2:
        return const BasketView();
    }
    return const HomeView();
  }
}

class BottomNavBarStates {
  BottomNavBarStates({required this.currentIndex});

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: StringConstant.bnvHome),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: StringConstant.bnvFavourites),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag), label: StringConstant.bnvBasket),
  ];
  final int currentIndex;

  BottomNavBarStates copyWith({int? currentIndex}) {
    return BottomNavBarStates(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
