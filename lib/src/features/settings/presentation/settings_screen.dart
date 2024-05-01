import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../theme/constants/app_colors.dart';
import '../../../utils/constants/app_assets.dart';
import '../../profile/presentation/widgets/language_bottom_sheet.dart';
import '../../profile/presentation/widgets/profile_info_bottom_sheet.dart';
import '../../profile/presentation/widgets/theme_bottom_sheet.dart';

class SettingsScreen extends StatefulWidget {
  static const route = r'/settings';

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              title:  Text(
                'Settings',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                Card(
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.onBackground,
                    leading: SvgPicture.asset(
                      AppAssets.language_icon,
                    ),
                    title: Text(r'language'.tr),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 20,
                    ),
                    onTap: () => onLangChangePressed(context),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.onBackground,
                    leading: SvgPicture.asset(
                      AppAssets.dark_mode,
                    ),
                    title: Text(
                      r'theme'.tr,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                      size: 20,
                    ),
                    onTap: () => onThemeChangePressed(context),
                  ),
                ),

                // ProfileCustomListTile(
                //   leading: SvgPicture.asset(AppAssets.language_icon),
                //   title: r'language'.tr,
                //   onTap: () => onLangChangePressed(context),
                // ),
                // ProfileCustomListTile(
                //   leading: SvgPicture.asset(AppAssets.dark_mode),
                //   title: r'theme'.tr,
                //   onTap: () => onThemeChangePressed(context),
                // ),
                // ProfileCustomListTile(
                //     title: r'sign_out'.tr,
                //     onTap: () {
                //       accountController.logout();
                //     },
                //     icon: const Icon(
                //       Icons.logout_rounded,
                //       color: Colors.grey,
                //       size: 20,
                //     )),
                // ProfileCustomListTile(
                //   title: r'delete_account'.tr,
                //   onTap: () {
                //     accountController.logout();
                //   },
                //   icon: Icon(
                //     Icons.delete_outline_rounded,
                //     color: colorScheme.error,
                //   ),
                // ),
              ],
            ))
          ])),
    );
  }

  Future<void> onLangChangePressed(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  Future<void> onThemeChangePressed(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ThemeBottomSheet(),
    );
  }

  Future<void> onEditPressed(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const ProfileInfoBottomSheet());
  }
}
