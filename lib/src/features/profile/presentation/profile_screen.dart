import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../account/controllers/account_status_controller.dart';
import '../../account/controllers/auth_controller.dart';
import 'widgets/profile_custom_list_tile.dart';
import 'widgets/profile_info_bottom_sheet.dart';
import 'widgets/profile_info_widget.dart';

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
        return Scaffold(
          backgroundColor:Theme.of(context).colorScheme.background,
          body:CustomScrollView(
          // StateControlWidget(
          //   // isLoading: accountStatus == AccountLoginStatus.loading,
          //   // isError: accountStatus == AccountLoginStatus.error,
          //   onError: accountController.logout,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [if (accountStatus == AccountLoginStatus.notLoggedIn)
                    //   ProfileCustomListTile(
                    //     title: r'sign_in'.tr,
                    //     onTap: () {
                    //       Get.toNamed(LoginScreen.route);
                    //     },
                    //     icon: const Icon(Icons.login_rounded),
                    //   ),
                    // if (accountStatus == AccountLoginStatus.loggedIn)
                      ProfileInfoWidget(
                        onEditTap: () => onEditPressed(context),
                        name: accountController.account.firstName ?? '',
                        phone: accountController.account.phone ?? '',
                      ),

                    if (accountStatus == AccountLoginStatus.loggedIn) ...[

                      ProfileCustomListTile(
                          title: r'sign_out'.tr,
                          onTap: () {
                            accountController.logout();
                          },
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: Colors.grey,
                            size: 20,
                          )),
                      ProfileCustomListTile(
                        title: r'delete_account'.tr,
                        onTap: () {
                          accountController.logout();
                        },
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: colorScheme.error,
                        ),
                      ),
                    ],
                  ],
                ),
              )
            ],

        ));
      },
    );
  }




  Future<void> onEditPressed(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => const ProfileInfoBottomSheet());
  }
}
