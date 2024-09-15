import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uber/constant/utils/colors.dart';
import 'package:uber/rider/controller/bottomNavBarRiderProvider/bottomNavBarRiderProvider.dart';
import 'package:uber/rider/view/account/accountScreenRider.dart';
import 'package:uber/rider/view/activity/activityScreen.dart';
import 'package:uber/rider/view/homeScreen/riderHomeScreen.dart';
import 'package:uber/rider/view/serviceScreen/serviceScreen.dart';

class BottomNavBarRider extends StatefulWidget {
  const BottomNavBarRider({super.key});

  @override
  State<BottomNavBarRider> createState() => _BottomNavBarRiderState();
}

class _BottomNavBarRiderState extends State<BottomNavBarRider> {
  List<Widget> screens = [
    const RiderHomeScreen(),
    const ServiceScreenRider(),
    const ActivityscreenRider(),
  ];

  List<PersistentBottomNavBarItem> _navBarItems(int currentTab) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
            currentTab == 0 ? CupertinoIcons.house_fill : CupertinoIcons.house),
        title: 'Home',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(currentTab == 0
            ? CupertinoIcons.circle_grid_3x3_fill
            : CupertinoIcons.circle_grid_3x3),
        title: 'Services',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(currentTab == 0
            ? CupertinoIcons.square_list_fill
            : CupertinoIcons.square_list),
        title: 'Activity',
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(currentTab == 0
      //       ? CupertinoIcons.person_fill
      //       : CupertinoIcons.person),
      //   title: 'Account',
      //   activeColorPrimary: black,
      //   inactiveColorPrimary: grey,
      // ),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarRiderProvider>(
        builder: (context, tabProvider, child) {
      return PersistentTabView(
        navBarStyle: NavBarStyle.style16,
        context,
        screens: screens,
        controller: controller,
        items: _navBarItems(tabProvider.currentTab),
        confineInSafeArea: true,
        onItemSelected: (value) {},
        backgroundColor: white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(
              8.sp,
            ),
            colorBehindNavBar: white),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(microseconds: 200), curve: Curves.ease),
        screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(microseconds: 200)),
      );
    });
  }
}
