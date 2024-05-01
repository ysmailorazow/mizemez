import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/globals.dart';
import '../../../core/local/key_value_storage_service.dart';
import '../../../core/states/statefull_data.dart';
import '../../../theme/constants/app_colors.dart';
import '../../../theme/constants/app_dimensions.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../widgets/elevated_button_with_state.dart';
import '../../account/repository/auth_repository.dart';
import '../../register/presentation/register_screen.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<LoginController>(
          init: LoginController(
            AuthRepository(apiService: ApiServices.apiService),
            key,
            KeyValueStorageService(),
          ),
          builder: (controller) => Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70.h,
                              ),
                              SizedBox(
                                width: 274.w,
                                child: Text(
                                  r'join'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // color: AppColors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              SizedBox(
                                width: 274.w,
                                child: Text(
                                  r'subscribe'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // color: AppColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 63.h,
                              ),
                               SizedBox(
                                width: 150.w,
                                height: 150.h,
                                child: Image(
                                  image: AssetImage(AppAssets.logo),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 8.h,
                        right: 10.w,
                        child: TextButton(
                          onPressed: () {
                            Get.to(RegisterScreen());
                          },
                          child: Text('sign_up'.tr, style: TextStyle(
                            color: Colors.green.shade500,fontWeight: FontWeight.bold,fontSize: 16.sp
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 380.h,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingExtraLarge,
                            ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(r'phone'.tr,style: TextStyle(fontSize: 15.sp)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 330.w,
                              child: TextFormField(
                                controller: controller.phoneController,
                                focusNode: controller.phoneFocus,
                                validator: (value) => controller.validatePhone(),
                                onTapOutside: (_) {
                                  controller.phoneFocus.unfocus();
                                },
                                keyboardType: TextInputType.phone,
                                maxLength: 8,
                                decoration:  InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(36.r))
                                  ),
                                  hintText: '6X XXXXXX',
                                  // labelText: '+993 6...',
                                  fillColor: Theme.of(context).colorScheme.inverseSurface,
                                  counter: SizedBox(),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  labelText: r'phone'.tr,labelStyle: TextStyle(color:Theme.of(context).colorScheme.onSurface,fontSize: 15  ),
                                  prefixText: '+993',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.paddingExtraLarge,
                            ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(r'password'.tr,style: TextStyle(fontSize: 15.sp),),
                            ),
                             SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 330.w,
                              child: TextFormField(
                                controller: controller.passwordController,
                                focusNode: controller.passwordFocus,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) => controller.validatePassword(),
                                obscureText: controller.obscureText,
                                onTapOutside: (_) {
                                  controller.passwordFocus.unfocus();
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: AppColors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(36.r))
                                  ),
                                  // labelText: 'password'.tr,
                                  suffixIcon: ObscureIcon(
                                    onPressed: controller.onObscureTapped,
                                    isObscure: controller.obscureText,
                                  ),
                                  fillColor: Theme.of(context).colorScheme.inverseSurface,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  labelText: '******',labelStyle: TextStyle(color:Theme.of(context).colorScheme.onSurface,fontSize: 15  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot password'.tr, style: TextStyle(
                                      color: Colors.green.shade500, fontSize: 15.sp
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 330.w,
                        height: 75.h,
                        margin:  EdgeInsets.only(top: 20.h),
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimensions.paddingMedium),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.r),
                          child: ElevatedButtonWithState(
                            isLoading: controller.state.status == Status.loading,
                            isError: controller.state.status == Status.error,
                            onPressed: () {
                              controller.onLoginTap();
                            },
                            child: Text('sign_in'.tr,style: TextStyle(fontSize: 18.sp),),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ObscureIcon extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onPressed;

  const ObscureIcon(
      {super.key, required this.isObscure, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.visibility_off_rounded),
      isSelected: isObscure,
      selectedIcon: const Icon(Icons.visibility_rounded),
    );
  }
}
