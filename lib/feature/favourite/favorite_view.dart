import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/add_to_basket.dart';
import 'package:e_commerce_app/product/widget/card/favourite.dart';
import 'package:e_commerce_app/product/widget/text/bold_text.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
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
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        final read = context.read<HomeViewModel>();

        bool isEmpty = true;
        final response = state.productList.where((x) => x.isFavourite == true).toList();
        if (response.isNotEmpty) {
          isEmpty = false;
        }
        return Scaffold(
          body: Padding(
            padding: context.padding.normal,
            child: Column(children: [
              TitleText(text: isEmpty ? StringConstant.favouriteNoFavTitle : StringConstant.favouriteTitle),
              context.sized.emptySizedHeightBoxLow3x,
              isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: context.sized.dynamicHeight(.65),
                      child: ListView.builder(
                        itemCount: response.length,
                        itemBuilder: (BuildContext context, int index) {
                          ProductModel indexedProduct = response[index];
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
                    )
            ]),
          ),
        );
      },
    );
  }
}
