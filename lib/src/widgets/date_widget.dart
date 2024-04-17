import 'package:flutter/material.dart';
import '../theme/constants/app_colors.dart';
import '../theme/constants/app_dimensions.dart';
import '../utils/date_time_parser.dart';

class DateWidget extends StatelessWidget {
  final DateTime? date;
  const DateWidget({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(AppDimensions.borderRadiusSmall),
          right: Radius.circular(AppDimensions.borderRadiusSmall),
        ),
        border: Border.all(
          width: 1.5,
          color: AppColors.orangeMediumLight,
        ),
      ),
      padding: const EdgeInsets.all(AppDimensions.paddingSmall / 2),
      child: Text(DateTimeParser.parseDate(date ?? DateTime.now(), '.')),
    );
  }
}
