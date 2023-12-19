import 'package:e_commerce_app/feature/base_view_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/list_view.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<BaseViewModel>().fetchProductsAndLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseViewModel, BaseStates>(
      builder: (contextBuilder, state) {
        final source = state.favouriteProductList;
        bool isEmpty = true;
        if (source.isNotEmpty) isEmpty = false;
        if (source.isEmpty) isEmpty = true;

        return Scaffold(
          body: Padding(
            padding: context.padding.normal,
            child: Column(children: [
              TitleText(text: isEmpty ? StringConstant.favouriteNoFavTitle : StringConstant.favouriteTitle),
              context.sized.emptySizedHeightBoxLow3x,
              isEmpty ? const SizedBox.shrink() : FavouriteProductList(source: source)
            ]),
          ),
        );
      },
    );
  }
}
