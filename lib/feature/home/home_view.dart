import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/list_view.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<HomeViewModel>().fetchAndLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        final read = context.read<HomeViewModel>();
        //await read.fetchProducts();
        final source = state.productList;
        read.fetchProducts();
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
