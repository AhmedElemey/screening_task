import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'products_view.dart';
import 'cart_view.dart';


// class HomeView extends StatefulWidget {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   int _selectedIndex = 0;
//   int _currentTab = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       bottomNavigationBar: BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Theme.of(context).colorScheme.primary,
//         currentIndex: _currentTab,
//         onTap: (int index) {
//           setState(() {
//             _currentTab = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               FeatherIcons.home,
//               size: 20,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FeatherIcons.search,
//               size: 20,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: CircleAvatar(
//               radius: 15,
//               backgroundImage: NetworkImage(
//                   'https://image.freepik.com/free-photo/pretty-smiling-redhead-woman-uses-mobile-phone-application-glad-get-message-from-boyfriend-has-pleasant-conversation-online-dressed-fasionable-autumn-clothes_273609-46944.jpg'),
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
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
      // PersistentBottomNavBarItem(
      //   icon: const Icon(FeatherIcons.home),
      //   title: ("Home"),
      //   activeColorPrimary: Colors.white,
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          FeatherIcons.shoppingBag,

          // color: Color(0xff873D3D),
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
      // PersistentBottomNavBarItem(
      //   icon: const Icon(
      //     FeatherIcons.user,
      //   ),
      //   title: ("User"),
      //   activeColorPrimary: Colors.white,
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
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
      // backgroundColor: Colors.white,
      backgroundColor: const Color(0xff171717),
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        // border: Border.all(
        //     width: 1.3,
        //     color: Theme.of(context).colorScheme.primary,
        //     style: BorderStyle.solid),
      ),
      popActionScreens: PopActionScreensType.all,
      navBarStyle:
      NavBarStyle.style13, //// Choose the nav bar style with this property.

      navBarHeight: 65,
    );
  }
}
