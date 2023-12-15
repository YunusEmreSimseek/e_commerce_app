import 'package:e_commerce_app/feature/base/bottom_nav_bar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarViewModel, BottomNavBarStates>(
      listener: (context, state) {},
      builder: (context, state) => BottomNavigationBar(
          items: state.items,
          currentIndex: state.currentIndex,
          onTap: (value) {
            return context.read<BottomNavBarViewModel>().changeCurrentIndex(value);
          }),
    );
  }
}
