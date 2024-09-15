import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uber/constant/utils/colors.dart';
import 'package:uber/rider/controller/bottomNavBarRiderProvider/bottomNavBarRiderProvider.dart';
import 'package:uber/rider/view/account/accountScreenRider.dart';
import 'package:uber/rider/view/activity/activityScreen.dart';
import 'package:uber/rider/view/bottomNavbar/bottomNavBarRider.dart';
import 'package:uber/rider/view/homeScreen/riderHomeScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:uber/rider/view/serviceScreen/serviceScreen.dart';

void main() {
  runApp(const Uber());
}

class Uber extends StatefulWidget {
  const Uber({super.key});

  @override
  State<Uber> createState() => _UberState();
}

class _UberState extends State<Uber> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<BottomNavBarRiderProvider>(
              create: (_) => BottomNavBarRiderProvider(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ThemeData(appBarTheme: AppBarTheme(color: white, elevation: 0)),
            home: const BottomNavBarRider(),
          ),
        );
      },
    );
  }
}
