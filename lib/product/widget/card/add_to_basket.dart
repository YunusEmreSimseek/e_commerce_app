import 'package:e_commerce_app/feature/basket/basket_view_model.dart';
import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/text/subtitle_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class AddtoBasketCard extends StatefulWidget {
  const AddtoBasketCard({super.key, required this.product});
  final ProductModel product;

  @override
  State<AddtoBasketCard> createState() => _AddtoBasketCardState();
}

class _AddtoBasketCardState extends State<AddtoBasketCard> {
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
