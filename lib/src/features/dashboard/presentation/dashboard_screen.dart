import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/rate/presentation/rate_screen.dart';
import '../../../theme/constants/app_colors.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../widgets/custom_navigator.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../controller/dashboard_controller.dart';
import '../utils/nested_nav_ids.dart';

class DashboardScreen extends StatefulWidget {
  static const route = r'/';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ColoredBox(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: WillPopScope(
              onWillPop: _controller.onWillPop,
              child: IndexedStack(
                index: _controller.currentIndex,
                sizing: StackFit.loose,
                children: const [
                  CustomNavigator(
                    initialRoute: HomeScreen(),
                    nestedId: NestedNavigationIds.home,
                  ),
                  CustomNavigator(
                    initialRoute: RateScreen(),
                    nestedId: NestedNavigationIds.rate,
                  ),
                  CustomNavigator(
                    initialRoute: ProfileScreen(),
                    nestedId: NestedNavigationIds.profile,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                _controller.updateCurrentIndex(index);
              },
              showUnselectedLabels: true,
              currentIndex: _controller.currentIndex,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              iconSize: 24.0,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: const _UnactiveIcon(icon: AppAssets.home_icon),
                  activeIcon: const _ActiveIcon(icon: AppAssets.home_icon),
                  label:  r'home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const _UnactiveIcon(icon: AppAssets.rate_icon),
                  activeIcon:
                      const _ActiveIcon(icon: AppAssets.rate_icon),
                  label:  r'rate'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const _UnactiveIcon(icon: AppAssets.profile_icon),
                  activeIcon:
                  const _ActiveIcon(icon: AppAssets.profile_icon),
                  label:  r'profile'.tr,
                ),
                // BottomNavigationBarItem(
                //   icon: GetBuilder<ChatsController>(
                //     builder: (controller) => _UnactiveIcon(
                //       icon: AppAssets.profileOutIcon,
                //       count: controller.unreadMessages,
                //     ),
                //   ),
                //   activeIcon: GetBuilder<ChatsController>(
                //     builder: (controller) => _ActiveIcon(
                //       icon: AppAssets.profileFillIcon,
                //       count: controller.unreadMessages,
                //     ),
                //   ),
                //   label: r'profile'.tr,
                // ),
              ],
            ),
            // child: WillPopScope(
            //   onWillPop: _controller.onWillPop,
            //   child: IndexedStack(
            //     index: _controller.currentIndex,
            //     children: const [
            //       CustomNavigator(
            //         initialRoute: HomeScreen(),
            //         nestedId: NestedNavigationIds.home,
            //       ),
            //       CustomNavigator(
            //         initialRoute: CategoriesScreen(),
            //         nestedId: NestedNavigationIds.categories,
            //       ),
            //       CustomNavigator(
            //         initialRoute: OthersScreen(),
            //         nestedId: NestedNavigationIds.others,
            //       ),
            //       CustomNavigator(
            //         initialRoute: CartScreen(),
            //         nestedId: NestedNavigationIds.cart,
            //       ),
            //       CustomNavigator(
            //         initialRoute: ProfileScreen(),
            //         nestedId: NestedNavigationIds.profile,
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}

class _ActiveIcon extends StatelessWidget {
  final String icon;
  final int? count;
  const _ActiveIcon({required this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    if (count != null && count! > 0) {
      return Stack(
        children: [
          SvgPicture.asset(
            icon,
            color: Theme.of(context).colorScheme.primary,
            // colorFilter: ColorFilter.mode(
            //   Theme.of(context).colorScheme.primary,
            //   BlendMode.srcIn,
            // ),
          ),
          // const Positioned(
          //   top: 0.0,
          //   right: 0.0,
          //   child: CounterBagdeWidget(
          //     radius: 5,
          //   ),
          // ),
        ],
      );
    }
    return SvgPicture.asset(
      icon,
      color: Theme.of(context).colorScheme.primary,
      // colorFilter: ColorFilter.mode(
      //   Theme.of(context).colorScheme.primary,
      //   BlendMode.srcIn,
      // ),
    );
  }
}

class _UnactiveIcon extends StatelessWidget {
  final String icon;
  final int? count;
  const _UnactiveIcon({required this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    if (count != null && count! > 0) {
      return Stack(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiary,
              BlendMode.srcIn,
            ),
          ),
          // const Positioned(
          //   top: 0.0,
          //   right: 0.0,
          //   child: CounterBagdeWidget(
          //     radius: 5,
          //   ),
          // ),
        ],
      );
    }
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.tertiary,
        BlendMode.srcIn,
      ),
    );
  }
}
