import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/feature/model/product_model.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:e_commerce_app/product/widget/text/bold_text.dart';
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
    return BlocBuilder<HomeViewModel, HomeStates>(
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
                ElevatedButton(
                    onPressed: () {
                      context.read<HomeViewModel>().changeLoading();
                    },
                    child: const Text('isloading'))
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
          height: context.sized.dynamicHeight(.6),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: state.productList.length,
            itemBuilder: (BuildContext context, int index) {
              ProductModel indexedProduct = state.productList[index];
              return Card(
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
                            height: context.sized.dynamicHeight(.18),
                            width: context.sized.dynamicWidth(.39),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    BoldText(title: indexedProduct.name),
                                    InkWell(
                                      onTap: () {},
                                      child: const Card(
                                        shape: CircleBorder(),
                                        child: Icon(CupertinoIcons.heart),
                                      ),
                                    )
                                  ],
                                ),
                                context.sized.emptySizedHeightBoxLow,
                                Text(indexedProduct.content),
                                context.sized.emptySizedHeightBoxLow,
                                Text('${indexedProduct.price.toString()} TL'),
                                context.sized.emptySizedHeightBoxLow,
                                const _AddtoBasketCard()
                              ],
                            )),
                      ],
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

class _AddtoBasketCard extends StatelessWidget {
  const _AddtoBasketCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicWidth(.2),
      child: InkWell(
        onTap: () {},
        child: const Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(CupertinoIcons.add),
            Text('Ekle'),
          ]),
        ),
      ),
    );
  }
}
