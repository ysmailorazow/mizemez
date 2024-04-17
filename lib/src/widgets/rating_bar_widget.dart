import 'package:flutter/material.dart';

import '../theme/constants/app_colors.dart';

class RatingBarWidget extends StatelessWidget {
  final int? rating;
  final int? rated;
  const RatingBarWidget({super.key, this.rating, this.rated});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            (rating ?? 0) > i
                ? Icons.star_rate_rounded
                : Icons.star_border_rounded,
            size: 16.0,
            color: AppColors.amberAccent,
          ),
        Flexible(
          child: Text(
            '(${rated ?? 0})',
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.grey,
                  fontSize: 12.0,
                ),
          ),
        ),
      ],
    );
  }
}
