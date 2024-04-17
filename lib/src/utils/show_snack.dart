import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/constants/app_dimensions.dart';
import '../theme/constants/app_colors.dart';

@immutable
class ShowSnack {
  static const _duration = Duration(milliseconds: 2500);
  static const _margin = EdgeInsets.all(AppDimensions.paddingLarge);
  static const _border = AppDimensions.borderRadiusLarge;

  static void showSnack(String message, SnackType snackType) async {
    late final String title;
    late final Color color;

    switch (snackType) {
      case SnackType.error:
        title = 'error'.tr;
        color = AppColors.red;
        break;
      case SnackType.warning:
        title = 'warning'.tr;
        color = AppColors.amberAccent;
        break;
      case SnackType.success:
        title = 'success'.tr;
        color = AppColors.green;
        break;
    }
    final snack = GetSnackBar(
      title: title,
      message: message,
      backgroundColor: color,
      duration: _duration,
      margin: _margin,
      borderRadius: _border,
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.closeCurrentSnackbar();
    Get.showSnackbar(snack);
  }
}

enum SnackType {
  error,
  warning,
  success,
}
