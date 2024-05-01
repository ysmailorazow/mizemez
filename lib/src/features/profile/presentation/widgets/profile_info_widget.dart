import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_market/src/features/iniatial/presentation/widget/carousel_widget.dart';
import 'package:x_market/src/features/settings/presentation/settings_screen.dart';


import '../../../../theme/constants/app_colors.dart';
import '../../../../theme/constants/app_dimensions.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../profile_settings/presentation/profile_settings_screen.dart';

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
    return SafeArea(
      child: Column(
        children: [
          SizedBox(

            height: 400.h,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
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
                        child: IconButton(onPressed: (){
                          Get.toNamed(SettingsScreen.route);
                        }, icon: Icon(Icons.settings))
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AppAssets.photo),
                ),

                SizedBox(height: 10.h),
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
                SizedBox(height: 15.h),
                CarouselWidget(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            width: 310.w,
            height: 200.h,
            child:  Column(

              children: [
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 10.w),
                      child: Text(
                        'Profile information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>ProfileSettingsScreen());
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(right: 15.w),
                        child: SvgPicture.asset(AppAssets.editIcon),
                      ),
                    ),
                  ],
                ),

               SizedBox(
                  height: 15.h,
                ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Ady Familiýasy',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        // name,
                        'Aman Amanow',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 15.h,
                ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Telefon belgisi',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        // "+993 $phone",
                        '+99365123456',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ]),
                 SizedBox(
                  height: 15.h,
                ),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Welaýat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        'Ahal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ]),
              ],
            ),
          )
        ],
      ),
    );
    // return Container(
    //   height: 190.0,
    //   margin: const EdgeInsets.all(AppDimensions.paddingLarge),
    //   padding: const EdgeInsets.all(AppDimensions.paddingSmall),
    //   decoration: BoxDecoration(
    //     color: Theme.of(context).colorScheme.background,
    //     boxShadow: [
    //       BoxShadow(
    //         blurRadius: 7.0,
    //         offset: const Offset(0, 1),
    //         color: colorScheme.shadow,
    //       )
    //     ],
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(AppDimensions.borderRadiusMedium),
    //     ),
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       const SizedBox(
    //         width: 100.0,
    //         height: 100.0,
    //         child: Image(
    //           image: AssetImage(AppAssets.accountImage),
    //         ),
    //       ),
    //       Text(
    //         name,
    //         style: TextStyle(
    //           color: Theme.of(context).colorScheme.outline,
    //           fontSize: 32,
    //           fontWeight: FontWeight.w600,
    //         ),
    //       ),
    //       Text(
    //         "+993 $phone",
    //         style: const TextStyle(
    //           color: Colors.grey,
    //           fontSize: 14,
    //           fontWeight: FontWeight.w400,
    //         ),
    //       ),
    //       // IconButton(
    //       //   onPressed: onEditTap,
    //       //   padding: const EdgeInsets.all(0),
    //       //   icon: const Icon(Icons.edit_square),
    //       // ),
    //     ],
    //   ),
    // );
  }
}
