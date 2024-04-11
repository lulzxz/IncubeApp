import 'package:flutter/material.dart';
import 'package:incube/pages/Homescreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> Navbar() {
      return [
        const Homescreen(),
        const Homescreen(),
        const Homescreen(),
        const Homescreen(),
        const Homescreen(),
      ];
    }

    List<PersistentBottomNavBarItem> NavbarItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ('Home'),
          activeColorPrimary: Color(0xFF2F80ED),
          inactiveColorPrimary: Color(0xFF6A6A6A),
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.settings),
            title: ('Setting'),
            activeColorPrimary: Color(0xFF2F80ED),
            inactiveColorPrimary: Color(0xFF6A6A6A)),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.bar_chart_rounded),
            title: ('Report'),
            activeColorPrimary: Color(0xFF2F80ED),
            inactiveColorPrimary: Color(0xFF6A6A6A)),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.child_care),
            title: ('Profile'),
            activeColorPrimary: Color(0xFF2F80ED),
            inactiveColorPrimary: Color(0xFF6A6A6A)),
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      screens: Navbar(),
      items: NavbarItems(),
      controller: controller,
      confineInSafeArea: true,
      backgroundColor: Color(0xFFFFFFFF),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10),
        colorBehindNavBar: Color(0xFFFFFFFF),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200), curve: Curves.ease),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
