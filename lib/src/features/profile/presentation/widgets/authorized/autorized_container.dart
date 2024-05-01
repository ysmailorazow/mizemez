import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../theme/constants/app_colors.dart';
import '../../../../../theme/constants/app_dimensions.dart';
import '../../../../../theme/controller/theme_controller.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../custom_list_tile.dart';

class AuthorizedContainer extends StatelessWidget {
  final void Function() onLogoutTapped;
  final VoidCallback onShopSettingsTapped;
  final bool isMe;
  const AuthorizedContainer(
      {super.key,
      required this.onLogoutTapped,
      required this.onShopSettingsTapped,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        // horizontal: AppDimensions.paddingExtraLarge,
        vertical: AppDimensions.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingExtraLarge,
            ),
            child: Text(
              r'settings'.tr,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          const Divider(
            color: AppColors.yellow,
            height: 1.0,
            thickness: 0.5,
          ),
          Column(
            children: [
              CustomListTile(
                icon: AppAssets.profile_icon,
                title: r'profile_settings'.tr,
                onTap: () {},
              ),
              const Divider(
                color: AppColors.yellow,
                height: 1.0,
                thickness: 0.5,
              ),
            ],
          ),
          if (isMe)
            // Column(
            //   children: [
            //     CustomListTile(
            //       icon: AppAssets.basketSvg,
            //       title: r'shop_settings'.tr,
            //       onTap: () {
            //         onShopSettingsTapped();
            //       },
            //     ),
            //     const Divider(
            //       color: AppColors.yellow,
            //       height: 1.0,
            //       thickness: 0.5,
            //     ),
            //   ],
            // ),
          // Column(
          //   children: [
          //     GetBuilder<ChatsController>(
          //       builder: (controller) => CustomListTile(
          //         icon: AppAssets.chatsIcon,
          //         title: r'chats'.tr,
          //         trailing: controller.unreadMessages > 0
          //             ? CounterBagdeWidget(
          //                 radius: 12.0,
          //                 count: controller.unreadMessages,
          //               )
          //             : null,
          //         onTap: () {
          //           Get.toNamed(ChatsScreen.route);
          //         },
          //       ),
          //     ),
          //     const Divider(
          //       color: AppColors.orangeMediumLight,
          //       height: 1.0,
          //       thickness: 0.5,
          //     ),
          //   ],
          // ),
          // Column(
          //   children: [
          //     CustomListTile(
          //       icon: AppAssets.heartIcon,
          //       title: r'wishlist'.tr,
          //       onTap: () {
          //         Get.toNamed(FavoritesScreen.route);
          //       },
          //     ),
          //     const Divider(
          //       color: AppColors.orangeMediumLight,
          //       height: 1.0,
          //       thickness: 0.5,
          //     ),
          //   ],
          // ),
          // Column(
          //   children: [
          //     CustomListTile(
          //       icon: AppAssets.notificationStatusIcon,
          //       title: r'my_products'.tr,
          //       onTap: () {
          //         Get.toNamed(MyProducts.route);
          //       },
          //     ),
          //     const Divider(
          //       color: AppColors.orangeMediumLight,
          //       height: 1.0,
          //       thickness: 0.5,
          //     ),
          //   ],
          // ),
          // Column(
          //   children: [
          //     CustomListTile(
          //       icon: AppAssets.chatIcon,
          //       title: r'comments'.tr,
          //       onTap: () {
          //         Get.toNamed(CommentsScreen.route, arguments: {
          //           'is_customer': true,
          //         });
          //       },
          //     ),
          //     const Divider(
          //       color: AppColors.orangeMediumLight,
          //       height: 1.0,
          //       thickness: 0.5,
          //     ),
          //   ],
          // ),
          Column(
            children: [
              GetBuilder<ThemeController>(
                builder: (themeController) => CustomListTile(
                  icon: themeController.isDarkMode
                      ? AppAssets.darkModeLogo
                      : AppAssets.lightModeLogo,
                  title: r'dark_mode'.tr,
                  onTap: () {
                    themeController.changeMode();
                  },
                  trailing: Switch.adaptive(
                    onChanged: (bool value) {
                      themeController.changeMode();
                    },
                    value: themeController.isDarkMode,
                  ),
                ),
              ),
              const Divider(
                color: AppColors.yellow,
                height: 1.0,
                thickness: 0.5,
              ),
            ],
          ),
          // Column(
          //   children: [
          //     CustomListTile(
          //       icon: AppAssets.paperPlusIcon,
          //       title: r'add_product'.tr,
          //       onTap: () {
          //         Get.toNamed(AddProductScreen.route);
          //       },
          //     ),
          //     const Divider(
          //       color: AppColors.orangeMediumLight,
          //       height: 1.0,
          //       thickness: 0.5,
          //     ),
          //   ],
          // ),
          // Column(
          //   children: [
          //     CustomListTile(
          //       icon: AppAssets.adBanner,
          //       title: r'logout'.tr,
          //       onTap: onLogoutTapped,
          //       isLogout: true,
          //     ),
          //     const Divider(
          //       color: AppColors.yellow,
          //       height: 1.0,
          //       thickness: 0.5,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
