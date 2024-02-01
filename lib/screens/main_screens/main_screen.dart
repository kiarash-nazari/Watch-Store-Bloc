import 'package:flutter/material.dart';
import 'package:watch_store_bloc/components/text_style.dart';
import 'package:watch_store_bloc/gen/assets.gen.dart';
import 'package:watch_store_bloc/res/colors.dart';
import 'package:watch_store_bloc/res/stings.dart';
import 'package:watch_store_bloc/screens/cart_screen.dart';
import 'package:watch_store_bloc/screens/main_screens/profile_screen.dart';
import 'package:watch_store_bloc/screens/main_screens/home_screen.dart';
import 'package:watch_store_bloc/widgets/badge.dart';
import 'package:watch_store_bloc/widgets/navigation_button.dart';

class ScreenButtonNavigationIndex {
  static const homeIndex = 0;
  static const profilIndex = 1;
  static const cartIndex = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

List<int> routeHistory = [0];

int indexStack = ScreenButtonNavigationIndex.homeIndex;
final GlobalKey<NavigatorState> _homeScreenKey = GlobalKey();
final GlobalKey<NavigatorState> _profileScreenKey = GlobalKey();
final GlobalKey<NavigatorState> _cartScreenKey = GlobalKey();

Map<int, GlobalKey<NavigatorState>> map = {
  ScreenButtonNavigationIndex.homeIndex: _homeScreenKey,
  ScreenButtonNavigationIndex.profilIndex: _profileScreenKey,
  ScreenButtonNavigationIndex.cartIndex: _cartScreenKey
};

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Function(dynamic) canPop = ((didPop) {
      if (map[indexStack]!.currentState!.canPop()) {
        map[indexStack]!.currentState!.pop();
      } else if (routeHistory.length > 1) {
        routeHistory.removeLast();
        indexStack = routeHistory.last;
        setState(() {});
      }
    });
    return PopScope(
      canPop: false,
      onPopInvoked: canPop,
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            top: 0,
            bottom: size.height * 0.1,
            left: 0,
            right: 0,
            child: IndexedStack(
              index: routeHistory.last,
              children: [
                Navigator(
                  key: _homeScreenKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ),
                Navigator(
                  key: _profileScreenKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                ),
                Navigator(
                  key: _cartScreenKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.1,
              color: AppColors.btmNavColor,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavigationButton(
                      svgPath: Assets.svg.user,
                      title: AppStrings.profile,
                      isActive:
                          indexStack == ScreenButtonNavigationIndex.profilIndex,
                      onTap: () {
                        btnNavOnPress(
                            index: ScreenButtonNavigationIndex.profilIndex);
                      },
                    ),
                    // NavigationButton(
                    //   svgPath: Assets.svg.cart,
                    //   title: AppStrings.basket,
                    //   isActive:
                    //       indexStack == ScreenButtonNavigationIndex.basketIndex,
                    //   onTap: () {
                    //     btnNavOnPress(
                    //         index: ScreenButtonNavigationIndex.basketIndex);
                    //   },
                    // ),

                    //TODO badge count is static change to dynamic
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BadgeWidget(
                          cart: true,
                          badge: 2,
                          onTap: () {
                            btnNavOnPress(
                                index: ScreenButtonNavigationIndex.cartIndex);
                          },
                          isActive: indexStack ==
                              ScreenButtonNavigationIndex.cartIndex,
                        ),
                        Text(
                          AppStrings.basket,
                          style: indexStack ==
                                  ScreenButtonNavigationIndex.cartIndex
                              ? LightTextAppStyle.navigationBtmActive
                              : LightTextAppStyle.navigationBtmInActive,
                        )
                      ],
                    ),
                    NavigationButton(
                      svgPath: Assets.svg.home,
                      title: AppStrings.home,
                      isActive:
                          indexStack == ScreenButtonNavigationIndex.homeIndex,
                      onTap: () {
                        btnNavOnPress(
                            index: ScreenButtonNavigationIndex.homeIndex);
                      },
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }

  btnNavOnPress({required index}) {
    setState(() {
      indexStack = index;
      routeHistory.add(index);
    });
  }
}
