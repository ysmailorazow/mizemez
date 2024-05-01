import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_market/src/features/dashboard/utils/nested_nav_ids.dart';

import '../features/profile/presentation/profile_screen.dart';
import '../utils/constants/app_assets.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AppAssets.photo),
        ),
      ),
    );
  }
}
