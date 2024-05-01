import 'package:flutter/material.dart';

import '../../../../theme/constants/app_colors.dart';
import '../../../../theme/constants/app_dimensions.dart';

class ContainerWithIcon extends StatelessWidget {
  final IconData icon;
  const ContainerWithIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusSmall),
            right: Radius.circular(AppDimensions.borderRadiusSmall),
          ),
        ),
        padding: const EdgeInsets.all(AppDimensions.paddingSmall),
        child: Icon(
          icon,
          color: AppColors.orange,
        ));
  }
}
