import 'package:flutter/material.dart';

import '../../../../theme/constants/app_dimensions.dart';

class ProfileCustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget? icon;
  final Widget? leading;

  const ProfileCustomListTile(
      {super.key, required this.title, required this.onTap, this.icon, this.leading});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 7.0,
            offset: const Offset(0, 1),
            color: colorScheme.shadow,
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.borderRadiusMedium),
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge, vertical: AppDimensions.paddingSmall),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingLarge,
        vertical: 3,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.borderRadiusMedium),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              Expanded(
                child: Text(title),
              ),
              icon ?? const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey, size: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
