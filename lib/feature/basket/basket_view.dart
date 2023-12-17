import 'package:e_commerce_app/feature/basket/basket_view_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/card/list_view.dart';
import 'package:e_commerce_app/product/widget/text/bold_text.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:e_commerce_app/product/widget/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketViewModel, BasketStates>(
      builder: (context, state) {
        final read = context.read<BasketViewModel>();
        final source = state.productList;
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
              isEmpty
                  ? const SizedBox.shrink()
                  : FavouriteProductList(
                      source: source!,
                      isBasket: true,
                    ),
              context.sized.emptySizedHeightBoxLow3x,
              isEmpty
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoldText(
                            title:
                                '${StringConstant.basketTotalPrice} : ${read.calculateTotalPrice()} ${StringConstant.generalEuro}'),
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
