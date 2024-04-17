import 'package:flutter/material.dart';


import '../../../../theme/constants/app_dimensions.dart';
import '../../../../utils/constants/app_assets.dart';

class ProfileInfoWidget extends StatelessWidget {
  final VoidCallback onEditTap;
  final String name;
  final String phone;
  const ProfileInfoWidget(
      {super.key,
      required this.onEditTap,
      required this.name,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 190.0,
      margin: const EdgeInsets.all(AppDimensions.paddingLarge),
      padding: const EdgeInsets.all(AppDimensions.paddingSmall),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image(
              image: AssetImage(AppAssets.accountImage),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "+993 $phone",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          // IconButton(
          //   onPressed: onEditTap,
          //   padding: const EdgeInsets.all(0),
          //   icon: const Icon(Icons.edit_square),
          // ),
        ],
      ),
    );
  }
}
