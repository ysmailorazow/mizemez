import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:secgi/features/cart/presentation/cart_screen.dart';
// import 'package:secgi/features/categories/presentation/categories_screen.dart';
// import 'package:secgi/features/dashboard/presentation/dashboard_screen.dart';
// import 'package:secgi/features/home/presentation/home_screen.dart';
// import 'package:secgi/features/profile/presentation/profile_screen.dart';
// import 'package:secgi/features/vendors/presentation/vendors_screen.dart';

import '../features/dashboard/presentation/dashboard_screen.dart';

class CustomNavigator extends StatelessWidget {
  final Widget initialRoute;
  final int nestedId;

  const CustomNavigator(
      {required this.initialRoute, required this.nestedId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(nestedId),
      onGenerateRoute: _routes(initialRoute),
    );
  }

  RouteFactory _routes(Widget initialRoute) {
    return (settings) {
      // final Map<dynamic, dynamic>? arguments =
      //     settings.arguments as Map<dynamic, dynamic>?;
      Widget screen;
      switch (settings.name) {
        case DashboardScreen.route:
          screen = initialRoute;
          break;
        // case HomeScreen.route:
        //   screen = const HomeScreen();
        //   break;
        // case CategoriesScreen.route:
        //   screen = const CategoriesScreen();
        //   break;
        // case VendorsScreen.route:
        //   screen = const VendorsScreen();
        //   break;
        // case CartScreen.route:
        //   screen = const CartScreen();
        //   break;
        // case ProfileScreen.route:
        //   screen = const ProfileScreen();
        //   break;
        default:
          screen = Container(
            color: Colors.red,
          );
          break;
      }
      return GetPageRoute(
          routeName: settings.name,
          page: () => screen,
          transition: Transition.cupertino,
          curve: Curves.fastOutSlowIn);
    };
  }
}
