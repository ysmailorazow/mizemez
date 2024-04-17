import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/constants/app_dimensions.dart';
import '../../../../theme/controller/theme_controller.dart';
import 'profile_custom_list_tile.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppDimensions.borderRadiusLarge),
              topRight: Radius.circular(AppDimensions.borderRadiusLarge),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppDimensions.paddingExtraLarge +
                    AppDimensions.paddingMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimensions.paddingMedium,
                    horizontal: AppDimensions.paddingLarge),
                child: Text(
                  r'choose_theme'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                      ProfileCustomListTile(
                        onTap: () {
                          themeController.changeMode();
                          Navigator.pop(context);
                        },
                        title: r'light'.tr,
                        icon: Icon(
                          !themeController.isDarkMode
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          key: const Key('true'),
                          color: !themeController.isDarkMode
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ProfileCustomListTile(
                      onTap: () {
                        themeController.changeMode();
                        Navigator.pop(context);
                      },
                      title: r'dark'.tr,
                      icon: Icon(
                        themeController.isDarkMode
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_rounded,
                        key: const Key('true'),
                        color: themeController.isDarkMode
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppDimensions.paddingExtraLarge,
              ),
            ],
          ),
        ),
        Positioned(
          top: AppDimensions.paddingLarge,
          child: Container(
            width: 115.0,
            height: 7.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(
                AppDimensions.borderRadiusExtraLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
