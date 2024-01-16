import 'package:bloc_watch_store/gen/assets.gen.dart';
import 'package:bloc_watch_store/res/colors.dart';
import 'package:bloc_watch_store/res/stings.dart';
import 'package:bloc_watch_store/screens/main_screens/bascket_screen.dart';
import 'package:bloc_watch_store/screens/main_screens/home_screen.dart';
import 'package:bloc_watch_store/screens/main_screens/profile_screen.dart';
import 'package:bloc_watch_store/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenButtonNavigationIndex {
  static const homeIndex = 0;
  static const profilIndex = 1;
  static const basketIndex = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int indexStack = ScreenButtonNavigationIndex.homeIndex;
final GlobalKey<NavigatorState> _homeScreenKey = GlobalKey();
final GlobalKey<NavigatorState> _profileScreenKey = GlobalKey();
final GlobalKey<NavigatorState> _bascketScreenKey = GlobalKey();
Map<int, GlobalKey<NavigatorState>> map = {
  ScreenButtonNavigationIndex.homeIndex: _homeScreenKey,
  ScreenButtonNavigationIndex.profilIndex: _profileScreenKey,
  ScreenButtonNavigationIndex.basketIndex: _bascketScreenKey
};

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final Function(dynamic) canPop = ((didPop) {
      if (map[indexStack]!.currentState!.canPop()) {
        map[indexStack]!.currentState!.pop();
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
              index: indexStack,
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
                  key: _bascketScreenKey,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => const BascketScreen(),
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
                      onTap: () => btnNavOnPress(
                          index: ScreenButtonNavigationIndex.profilIndex),
                    ),
                    NavigationButton(
                      svgPath: Assets.svg.cart,
                      title: AppStrings.basket,
                      isActive:
                          indexStack == ScreenButtonNavigationIndex.basketIndex,
                      onTap: () => btnNavOnPress(
                          index: ScreenButtonNavigationIndex.basketIndex),
                    ),
                    NavigationButton(
                      svgPath: Assets.svg.home,
                      title: AppStrings.home,
                      isActive:
                          indexStack == ScreenButtonNavigationIndex.homeIndex,
                      onTap: () => btnNavOnPress(
                          index: ScreenButtonNavigationIndex.homeIndex),
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
    });
  }
}
