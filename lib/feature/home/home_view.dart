import 'package:e_commerce_app/feature/basket/basket_view_model.dart';
import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/add_to_basket.dart';
import 'package:e_commerce_app/product/widget/card/favourite.dart';
import 'package:e_commerce_app/product/widget/text/bold_text.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<BasketViewModel, BasketStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            // scrollDirection: Axis.vertical,
            // physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: context.padding.normal,
              child: Column(children: [
                const TitleText(text: StringConstant.homeProducts),
                context.sized.emptySizedHeightBoxLow3x,
                const _ProductCard(),
              ]),
            ),
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        return SizedBox(
          height: context.sized.dynamicHeight(.7),
          child: ListView.builder(
            itemCount: state.productList.length,
            itemBuilder: (BuildContext context, int index) {
              ProductModel indexedProduct = state.productList[index];
              return Padding(
                padding: context.padding.verticalLow,
                child: Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: SizedBox(
                    height: context.sized.dynamicHeight(.28),
                    width: double.infinity,
                    child: Padding(
                      padding: context.padding.horizontalLow,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(indexedProduct.imagePath),
                          SizedBox(
                              height: context.sized.dynamicHeight(.2),
                              width: context.sized.dynamicWidth(.45),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: context.padding.onlyRightLow,
                                        child: BoldText(title: indexedProduct.name),
                                      ),
                                      IsFavourite(
                                        index: index,
                                      )
                                    ],
                                  ),
                                  context.sized.emptySizedHeightBoxLow,
                                  SubtitleText(text: indexedProduct.content),
                                  // Text(indexedProduct.content),
                                  context.sized.emptySizedHeightBoxLow,
                                  SubtitleText(text: '${indexedProduct.price.toString()} TL'),
                                  //Text('${indexedProduct.price.toString()} TL'),
                                  context.sized.emptySizedHeightBoxLow,
                                  AddtoBasketCard(
                                    product: indexedProduct,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _AddtoBasketCard extends StatefulWidget {
  const _AddtoBasketCard({required this.product});
  final ProductModel product;

  @override
  State<_AddtoBasketCard> createState() => _AddtoBasketCardState();
}

class _AddtoBasketCardState extends State<_AddtoBasketCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketViewModel, BasketStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final read = context.read<BasketViewModel>();
        bool isContain = false;
        if (state.productList != null) {
          if (state.productList!.isEmpty) {
            isContain = false;
          } else if (state.productList!.contains(widget.product)) {
            isContain = true;
          }
        } else if (state.productList == null) {
          isContain = false;
        } else {
          isContain = false;
        }

        return SizedBox(
          width: context.sized.dynamicWidth(.2),
          child: InkWell(
            onTap: () {
              isContain ? read.takeProductFromBasket(widget.product) : read.addProductIntoBasket(widget.product);
            },
            child: Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                isContain ? const Icon(CupertinoIcons.bag_badge_minus) : const Icon(CupertinoIcons.bag_badge_plus),
                isContain
                    ? const SubtitleText(text: StringConstant.homeMinus)
                    : const SubtitleText(text: StringConstant.homeAdd),
              ]),
            ),
          ),
        );
      },
    );
  }
}
