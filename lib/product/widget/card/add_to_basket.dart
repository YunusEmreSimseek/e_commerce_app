import 'package:e_commerce_app/feature/base_view_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/models/new_product_model.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class AddOrMinustoBasketCard extends StatelessWidget {
  const AddOrMinustoBasketCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseViewModel, BaseStates>(
      builder: (context, state) {
        final read = context.read<BaseViewModel>();
        final productListInBasket = state.productListInBasket;
        bool isContain = false;

        if (productListInBasket.isNotEmpty && productListInBasket.where((x) => x.id == product.id).isNotEmpty) {
          isContain = true;
        } else {
          isContain = false;
        }

        return SizedBox(
          width: context.sized.dynamicWidth(.2),
          child: InkWell(
            onTap: () {
              isContain ? read.minusProductFromBasket(product) : read.addProductIntoBasket(product);
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
