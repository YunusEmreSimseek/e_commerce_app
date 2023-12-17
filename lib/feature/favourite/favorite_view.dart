import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/list_view.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (contextBuilder, state) {
        bool isEmpty = true;
        final response = state.productList.where((x) => x.isFavourite == true).toList();
        if (response.isNotEmpty) {
          isEmpty = false;
        } else if (response.isEmpty) {
          isEmpty = true;
        }
        return Scaffold(
          body: Padding(
            padding: context.padding.normal,
            child: Column(children: [
              TitleText(text: isEmpty ? StringConstant.favouriteNoFavTitle : StringConstant.favouriteTitle),
              context.sized.emptySizedHeightBoxLow3x,
              isEmpty ? const SizedBox.shrink() : FavouriteProductList(source: response)
            ]),
          ),
        );
      },
    );
  }
}
