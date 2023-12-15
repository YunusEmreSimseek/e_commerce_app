import 'package:e_commerce_app/feature/home/home_viewmodel.dart';
import 'package:e_commerce_app/product/constant/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: BlocConsumer<HomeViewModel, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Center(
                  child: state.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : null,
                )
              ],
              title: const Text(StringConstant.bnvHome),
            ),
            body: Column(children: [
              const Text('data'),
              const Text('data'),
              const Text('data'),
              const Text('data'),
              const Text('data'),
              const Text('data'),
              const Text('data'),
              const Text('data'),
              ElevatedButton(
                  onPressed: () {
                    context.read<HomeViewModel>().changeLoading();
                  },
                  child: const Text('isloading'))
            ]),
          );
        },
      ),
    );
  }
}
