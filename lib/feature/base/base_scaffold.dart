import 'package:e_commerce_app/feature/base/bottom_nav_bar.dart';
import 'package:e_commerce_app/feature/base/bottom_nav_bar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBarViewModel>(
      create: (context) => BottomNavBarViewModel(),
      child: BlocConsumer<BottomNavBarViewModel, BottomNavBarStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: const BottomNavBar(), body: context.read<BottomNavBarViewModel>().decisionBody());
        },
      ),
    );
  }
}
