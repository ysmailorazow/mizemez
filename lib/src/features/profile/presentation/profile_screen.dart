import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/profile/presentation/widgets/theme_bottom_sheet.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';
import 'package:x_market/src/utils/constants/app_assets.dart';
import '../../../widgets/state_control_widget.dart';
import '../../account/controllers/account_status_controller.dart';
import '../../account/controllers/auth_controller.dart';
import 'widgets/language_bottom_sheet.dart';
import 'widgets/profile_custom_list_tile.dart';
import 'widgets/profile_info_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  static const route = r'/profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  final accountController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<AccountLoginStatusController>(
      builder: (controller) {
        final accountStatus = controller.accountLoginStatus.value;
        return Container(
          color: colorScheme.secondaryContainer,
          child: StateControlWidget(
            // isLoading: accountStatus == AccountLoginStatus.loading,
            // isError: accountStatus == AccountLoginStatus.error,
            // titleWidget: const AppBarTitleWidget(),
            onError: accountController.logout,
            slivers: [

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Card(
                      color: AppColors.card_grey,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          AppAssets.language_icon,
                        ),
                        title: Text(r'language'.tr),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                        onTap: () => onLangChangePressed(context),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: AppColors.card_grey,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          AppAssets.dark_mode,
                        ),
                        title: Text(
                          r'theme'.tr,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
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
                ),
              )
            ],
          ),
        );
      },
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
