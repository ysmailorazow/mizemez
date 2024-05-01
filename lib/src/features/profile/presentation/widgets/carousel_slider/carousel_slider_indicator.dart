import 'package:flutter/material.dart';

import '../../../../../theme/constants/app_dimensions.dart';



class CarouselSliderIndicator extends StatelessWidget {
  const CarouselSliderIndicator(
      {Key? key, required this.dotIndex, required this.bannerIndex})
      : super(key: key);

  final int dotIndex;
  final int bannerIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: AppDimensions.paddingSmall),
      height: 6.0,
      width: 6.0,
      decoration: BoxDecoration(
        color: bannerIndex == dotIndex
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        shape: BoxShape.circle,
      ),
    );
  }
}
