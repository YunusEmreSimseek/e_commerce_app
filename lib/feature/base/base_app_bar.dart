part of 'base_scaffold.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        BlocBuilder<BaseViewModel, BaseStates>(builder: (contextBuilderHome, stateBilderHome) {
          if (stateBilderHome.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return context.sized.emptySizedHeightBoxLow;
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
