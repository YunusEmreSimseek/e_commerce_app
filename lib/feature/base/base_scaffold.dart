import 'package:e_commerce_app/feature/base/bottom_nav_bar_viewmodel.dart';
import 'package:e_commerce_app/feature/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

part 'base_app_bar.dart';
part 'bottom_nav_bar.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBarViewModel>(create: (contextBottom) => BottomNavBarViewModel()),
        BlocProvider<BaseViewModel>(create: (contextHome) => BaseViewModel()),
      ],
      child: BlocBuilder<BottomNavBarViewModel, BottomNavBarStates>(
        builder: (contextBuilderBottom, stateBuilderBottom) {
          final String title = contextBuilderBottom.read<BottomNavBarViewModel>().decisionAppbarText();
          final Widget page = contextBuilderBottom.read<BottomNavBarViewModel>().decisionBody();
          return Scaffold(
            appBar: BaseAppBar(title: title),
            bottomNavigationBar: const BottomNavBar(),
            body: page,
          );
        },
      ),
    );
  }
}
