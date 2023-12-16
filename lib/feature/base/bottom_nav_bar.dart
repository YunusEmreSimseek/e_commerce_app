part of 'base_scaffold.dart';

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
