import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/constants/app_colors.dart';
import '../../../../theme/constants/app_dimensions.dart';

class ProfileInfoBottomSheet extends StatelessWidget {
  const ProfileInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: MediaQuery.of(context).viewInsets,
      padding: const EdgeInsets.all(AppDimensions.paddingMedium),
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimensions.borderRadiusLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5.0,
              width: 60.0,
              constraints: const BoxConstraints(maxWidth: 60.0, minWidth: 60.0),
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.borderRadiusLarge),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppDimensions.paddingExtraLarge,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'username'.tr),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: colorScheme.error,
              side: BorderSide(color: colorScheme.error),
              fixedSize: Size.fromWidth(
                MediaQuery.of(context).size.width - AppDimensions.paddingMedium,
              ),
            ),
            child: Text(r'discard_changes'.tr),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(
                MediaQuery.of(context).size.width - AppDimensions.paddingMedium,
              ),
            ),
            child: Text(r'apply'.tr),
          ),
        ],
      ),
    );
  }
}
