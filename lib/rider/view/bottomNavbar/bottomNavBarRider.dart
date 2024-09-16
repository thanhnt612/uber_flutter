import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uber/constant/utils/colors.dart';
import 'package:uber/rider/controller/bottomNavBarRiderProvider/bottomNavBarRiderProvider.dart';
import 'package:uber/rider/view/activity/activityScreen.dart';
import 'package:uber/rider/view/homeScreen/riderHomeScreen.dart';
import 'package:uber/rider/view/serviceScreen/serviceScreen.dart';

class BottomNavBarRider extends StatefulWidget {
  const BottomNavBarRider({super.key});

  @override
  State<BottomNavBarRider> createState() => _BottomNavBarRiderState();
}

class _BottomNavBarRiderState extends State<BottomNavBarRider> {
  List<PersistentTabConfig> _navBarItems() {
    return [
      PersistentTabConfig(
        screen: const RiderHomeScreen(),
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.house),
          title: 'Home',
          activeForegroundColor: grey,
          inactiveForegroundColor: black,
        ),
      ),
      PersistentTabConfig(
        screen: const ServiceScreenRider(),
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.circle_grid_3x3),
          title: 'Services',
          activeForegroundColor: grey,
          inactiveForegroundColor: black,
        ),
      ),
      PersistentTabConfig(
        screen: const ActivityscreenRider(),
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.square_list),
          title: 'Activity',
          activeForegroundColor: grey,
          inactiveForegroundColor: black,
        ),
      ),
      PersistentTabConfig(
        screen: const ActivityscreenRider(),
        item: ItemConfig(
          icon: const Icon(CupertinoIcons.person),
          title: 'Account',
          activeForegroundColor: grey,
          inactiveForegroundColor: black,
        ),
      ),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarRiderProvider>(
        builder: (context, tabProvider, child) {
      return PersistentTabView(
        tabs: _navBarItems(),
        controller: controller,
        backgroundColor: white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: const ScreenTransitionAnimation(
            curve: Curves.ease, duration: Duration(microseconds: 200)),
      );
    });
  }
}
