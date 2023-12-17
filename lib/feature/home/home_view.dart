import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/list_view.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        final source = state.productList;
        return Scaffold(
          body: Padding(
            padding: context.padding.normal,
            child: Column(children: [
              const TitleText(text: StringConstant.homeProducts),
              context.sized.emptySizedHeightBoxLow3x,
              FavouriteProductList(source: source),
            ]),
          ),
        );
      },
    );
  }
}
