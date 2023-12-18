import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/models/new_product_model.dart';
import 'package:e_commerce_app/product/widget/card/add_to_basket.dart';
import 'package:e_commerce_app/product/widget/card/favourite.dart';
import 'package:e_commerce_app/product/widget/text/bold_text.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FavouriteProductList extends StatelessWidget {
  const FavouriteProductList({
    super.key,
    required this.source,
    this.isBasket = false,
  });

  final List<ProductModel> source;
  final bool isBasket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.dynamicHeight(isBasket ? CardSizes.lowListView.value : CardSizes.normalListView.value),
      child: ListView.builder(
        itemCount: source.length,
        itemBuilder: (BuildContext context, int index) {
          final indexedProduct = source[index];
          return Padding(
            padding: context.padding.verticalLow,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(context.border.highRadius)),
              child: SizedBox(
                height: context.sized.dynamicHeight(isBasket ? CardSizes.lowCard.value : CardSizes.normalCard.value),
                width: double.infinity,
                child: Padding(
                  padding: context.padding.horizontalLow,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(indexedProduct.imagePath ?? ''),
                      _columnOfCard(context, indexedProduct),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _columnOfCard(BuildContext context, ProductModel indexedProduct) {
    return SizedBox(
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
                  child: BoldText(title: indexedProduct.name ?? ''),
                ),
                IsFavourite(id: indexedProduct.id ?? ''),
              ],
            ),
            context.sized.emptySizedHeightBoxLow,
            SubtitleText(text: indexedProduct.content ?? ''),
            context.sized.emptySizedHeightBoxLow,
            SubtitleText(text: '${indexedProduct.price.toString()} ${StringConstant.generalEuro}'),
            context.sized.emptySizedHeightBoxLow,
            AddOrMinustoBasketCard(
              product: indexedProduct,
            )
          ],
        ));
  }
}

enum CardSizes {
  lowListView(value: 0.55),
  normalListView(value: 0.65),
  lowCard(value: 0.25),
  normalCard(value: 0.28);

  final double value;

  const CardSizes({required this.value});
}
