import 'package:e_commerce_app/feature/basket/basket_view_model.dart';
import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/text/bold_text.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketViewModel, BasketStates>(
      builder: (context, state) {
        final read = context.read<BasketViewModel>();

        bool isEmpty = true;
        if (state.productList != null) {
          state.productList!.isEmpty ? isEmpty = true : isEmpty = false;
        }

        return Scaffold(
          body: Padding(
            padding: context.padding.normal,
            child: Column(children: [
              isEmpty
                  ? const TitleText(text: StringConstant.basketNoProdTitle)
                  : const TitleText(text: StringConstant.basketTitle),
              context.sized.emptySizedHeightBoxLow3x,
              isEmpty ? const SizedBox.shrink() : const _ProductInBasket(),
              context.sized.emptySizedHeightBoxLow3x,
              isEmpty
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldText(title: '${StringConstant.basketTotalPrice} : ${read.calculateTotalPrice()}'),
                        context.sized.emptySizedWidthBoxNormal,
                        ElevatedButton(onPressed: () {}, child: const SubtitleText(text: StringConstant.basketOrder))
                      ],
                    )
            ]),
          ),
        );
      },
    );
  }
}

class _ProductInBasket extends StatelessWidget {
  const _ProductInBasket();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketViewModel, BasketStates>(
      builder: (context, state) {
        return SizedBox(
          height: context.sized.dynamicHeight(.55),
          child: ListView.builder(
            itemCount: state.productList?.length,
            itemBuilder: (BuildContext context, int index) {
              if (state.productList == null) return null;
              ProductModel? indexedProduct = state.productList![index];
              return Padding(
                padding: context.padding.verticalLow,
                child: Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: SizedBox(
                    height: context.sized.dynamicHeight(.25),
                    child: Padding(
                      padding: context.padding.horizontalLow,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(indexedProduct.imagePath),
                            SizedBox(
                                height: context.sized.dynamicHeight(.18),
                                width: context.sized.dynamicWidth(.39),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText(title: indexedProduct.name),
                                    context.sized.emptySizedHeightBoxLow,
                                    SubtitleText(text: '${indexedProduct.price.toString()} TL '),
                                  ],
                                ))
                          ]),
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
