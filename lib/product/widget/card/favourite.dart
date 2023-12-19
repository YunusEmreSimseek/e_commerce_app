import 'package:e_commerce_app/feature/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsFavourite extends StatelessWidget {
  const IsFavourite({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseViewModel, BaseStates>(
      builder: (context, state) {
        final isFavourite = state.productList.where((x) => x.id == id).single.isFavourite;

        return InkWell(
          onTap: () async {
            await context.read<BaseViewModel>().changeFavouriteAndFetchProducts(id);
          },
          child: Card(
            shape: const CircleBorder(),
            child: isFavourite ? const Icon(CupertinoIcons.heart_fill) : const Icon(CupertinoIcons.heart),
          ),
        );
      },
    );
  }
}
