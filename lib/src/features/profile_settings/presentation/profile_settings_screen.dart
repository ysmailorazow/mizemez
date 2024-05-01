import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/profile_settings/controllers/profile_settings_controller.dart';
import 'package:x_market/src/features/register/presentation/widget/dropdown_widget.dart';
import '../../../theme/constants/app_colors.dart';
import '../../../theme/constants/app_dimensions.dart';
import '../../../utils/constants/app_assets.dart';

class ProfileSettingsScreen extends StatefulWidget {
  static const route = r'/profil_settings';

  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GetBuilder<ProfileSettingsController>(
          init: ProfileSettingsController(),
          builder: (controller) =>CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.paddingSmall,
                    vertical: AppDimensions.paddingExtraLarge,
                  ),
                  sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Text(
                                        'Profile',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 15.w),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.settings))),
                                  ],
                                ),
                                Center(
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 60.r,
                                        backgroundImage: controller.image ==null? AssetImage(AppAssets.photo) : FileImage((controller.image!) )as ImageProvider?,
                                      ),
                                      Positioned(
                                        bottom: 40.w,
                                        right: 43.w,
                                        child: InkWell(
                                          onTap: (){
                                            controller.getImage();
                                          },
                                          child: SvgPicture.asset(AppAssets.upload_icon),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                 SizedBox(height: 8.h),
                                 SizedBox(
                                  child: Text(
                                    'Aman Amanow',
                                    // name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                 SizedBox(height: 30.h),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            width: 330.w,
                            // height: 350,
                            child: Column(
                              children: [
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Profile information',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(r'name'.tr),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical:6.w ),
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 330.w,
                                    child: TextFormField(
                                      // controller: controller.nameController,
                                      // focusNode: controller.nameFocus,
                                      keyboardType: TextInputType.text,
                                      // validator: (_) => controller.validateName(),
                                      // onTapOutside: (_) => controller.nameFocus.unfocus(),
                                      decoration: InputDecoration(
                                        fillColor: Theme.of(context).colorScheme.inverseSurface,
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide: const BorderSide(color: AppColors.grey),
                                            borderRadius: BorderRadius.all(Radius.circular(30.r))
                                        ),
                                        labelText: 'username'.tr,labelStyle: TextStyle(color:Theme.of(context).colorScheme.onSurface,fontSize: 15  ),
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(r'phone_number'.tr),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 6.w),
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 330.w,
                                    child: TextFormField(
                                      // controller: controller.phoneController,
                                      // focusNode: controller.phoneFocus,
                                      keyboardType: TextInputType.phone,
                                      // validator: (_) => controller.validatePhone(),
                                      // onTapOutside: (_) => controller.phoneFocus.unfocus(),
                                      maxLength: 8,
                                      decoration: InputDecoration(
                                        fillColor: Theme.of(context).colorScheme.inverseSurface,
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide: const BorderSide(color: AppColors.grey),
                                            borderRadius: BorderRadius.all(Radius.circular(30.r))
                                        ),
                                        hintText: '6X XXXXXX',
                                        counter: const SizedBox(),
                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                        labelText: 'phone'.tr,labelStyle: TextStyle(color:Theme.of(context).colorScheme.onSurface,fontSize: 15 ),
                                        prefixText: '+993 ',
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Welaýat'.tr),
                                ),
                                DropdownWidget(),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(r'parol'.tr),
                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 6.w),
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 330.w,
                                    child: TextFormField(
                                      // controller: controller.passwordController,
                                      // obscureText: controller.obscureText,
                                      keyboardType: TextInputType.visiblePassword,
                                      // validator: (_) => controller.validatePassword(),
                                      // focusNode: controller.passwordFocus,
                                      // onTapOutside: (_) => controller.passwordFocus.unfocus(),
                                      decoration: InputDecoration(
                                        fillColor: Theme.of(context).colorScheme.inverseSurface,
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide: const BorderSide(color: AppColors.grey),
                                            borderRadius: BorderRadius.all(Radius.circular(30.r))
                                        ),
                                        labelText: r"password".tr,labelStyle: TextStyle(color:Theme.of(context).colorScheme.onSurface,fontSize: 15  ),

                                        floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                        // suffixIcon: IconButton(
                                        //   // icon: Icon(controller.obscureText
                                        //   //     ? Icons.visibility_rounded
                                        //   //     : Icons.visibility_off_rounded),
                                        //   // onPressed: controller.onObscureTapped,
                                        // ),
                                        counter: null,
                                      ),
                                    ),
                                  ),
                                ),
                                 SizedBox(height: 50.h),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      SizedBox(
                                        width:100.w,
                                        height: 60.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30.r),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(),
                                            onPressed: () {},
                                            child: Text(
                                              'Ýatyr'.tr,
                                              style: TextStyle(fontSize: 18.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:210.w,
                                        height: 60.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30.r),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(),
                                            onPressed: () {},
                                            child: Text(
                                              'Ýatda sakla'.tr,
                                              style: TextStyle(fontSize: 18.sp
                                              ),
                                            ),
                                          ),
                                        ),
                                      )]
                                )
                              ],
                            ),
                          )
                        ],
                      )),

                )
              ]),
        ),
      ),
    );
  }
}
