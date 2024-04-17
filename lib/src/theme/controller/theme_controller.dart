import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/constants/app_assets.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();

  bool isDarkMode = false;
  String _logo = AppAssets.lightModeLogo;
  String get logo => _logo;

  void changeMode() {
    isDarkMode = !isDarkMode;
    _logo = isDarkMode ? AppAssets.darkModeLogo : AppAssets.lightModeLogo;
    _box.write(r'theme', isDarkMode);
    Get.changeThemeMode(!isDarkMode ? ThemeMode.light : ThemeMode.dark);
    update();
  }

  void _init() async {
    bool? isDarkMode = _box.read<bool>(r'theme');
    // if (isDarkMode == null) {
    //   var brightness = PlatformDispatcher.instance.platformBrightness;
    //   isDarkMode = brightness == Brightness.dark;
    // }
    isDarkMode ??= false;

    _logo = isDarkMode ? AppAssets.darkModeLogo : AppAssets.lightModeLogo;
    this.isDarkMode = isDarkMode;
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
