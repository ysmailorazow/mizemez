import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/constants/app_colors.dart';
import '../../../../theme/constants/app_dimensions.dart';

class CustomListTile extends StatelessWidget {
  final String icon;
  final Widget? leading;
  final String title;
  final void Function() onTap;
  final bool isLogout;
  final Widget? trailing;
  const CustomListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.isLogout = false,
      this.trailing,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium),
      child: ListTile(
        onTap: onTap,
        leading: leading ??
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color: isLogout
                    ? AppColors.grey
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(AppDimensions.borderRadiusSmall),
                  right: Radius.circular(AppDimensions.borderRadiusSmall),
                ),
              ),
              padding: const EdgeInsets.all(AppDimensions.paddingSmall),
              child: SvgPicture.asset(
                icon,
                theme: SvgTheme(
                  currentColor: isLogout
                      ? AppColors.redMedium
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isLogout ? AppColors.redMedium : null,
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing: trailing ??
            Container(
              decoration: BoxDecoration(
                color: isLogout
                    ? AppColors.redMedium
                    : Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(AppDimensions.paddingSmall),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.0,
                color: isLogout
                    ? AppColors.redMedium
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
      ),
    );
  }
}
