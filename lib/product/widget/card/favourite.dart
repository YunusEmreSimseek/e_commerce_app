import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsFavourite extends StatelessWidget {
  const IsFavourite({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<HomeViewModel>().changeFavourite(index);
          },
          child: Card(
            shape: const CircleBorder(),
            child: state.productList[index].isFavourite
                ? const Icon(CupertinoIcons.heart_fill)
                : const Icon(CupertinoIcons.heart),
          ),
        );
      },
    );
  }
}
