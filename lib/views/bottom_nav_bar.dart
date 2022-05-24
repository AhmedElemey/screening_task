import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'products_view.dart';
import 'cart_view.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const ProductView(),
      const CartScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          FeatherIcons.shoppingBag,
        ),
        title: ("Product"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          FeatherIcons.shoppingCart,
        ),
        title: ("Cart"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xff171717),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

      ),
      popActionScreens: PopActionScreensType.all,
      navBarStyle:
      NavBarStyle.style13, //// Choose the nav bar style with this property.

      navBarHeight: 65,
    );
  }
}
