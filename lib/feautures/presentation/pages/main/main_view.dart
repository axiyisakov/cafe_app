import 'package:cafe_app/feautures/presentation/bloc/main/cubit/main_cubit.dart';
import 'package:cafe_app/feautures/presentation/pages/products/products_screen.dart';
import 'package:cafe_app/feautures/presentation/pages/shoplist/shoplist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainCubit get cubit => context.read<MainCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, int>(
        builder: (context, state) {
          return CupertinoTabScaffold(
            controller: cubit.tabController,
            tabBar: CupertinoTabBar(
              currentIndex: state,
              height: kToolbarHeight,
              onTap: cubit.changePage,
              backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.chat_bubble,
                  ),
                  label: 'Products',
                  activeIcon: Icon(
                    CupertinoIcons.chat_bubble,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.compass,
                  ),
                  activeIcon: Icon(
                    CupertinoIcons.compass,
                  ),
                  label: 'Shoplist',
                ),
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: [
                    const ProductsScreen(),
                    const ShoplistScreen(),
                  ].elementAt(index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
