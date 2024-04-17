import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../localization/controller/language_controller.dart';
import '../../../../localization/localization_service.dart';
import '../../../../theme/constants/app_dimensions.dart';
import 'profile_custom_list_tile.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final langController = Get.find<LanguageController>();
    List<String> languages = LocalizationService.langs;
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
                  r'choose_language'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (var index = 0; index < languages.length; index++)
                      ProfileCustomListTile(
                        onTap: () {
                          if (index != langController.currentIndex.value) {
                            langController.updateLanguage(languages[index]);
                            Future.delayed(const Duration(milliseconds: 300))
                                .then((value) => Navigator.pop(context));
                          }
                        },
                        title: languages[index],
                        icon: Icon(
                          index == langController.currentIndex.value
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          key: const Key('true'),
                          color: index == langController.currentIndex.value
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
