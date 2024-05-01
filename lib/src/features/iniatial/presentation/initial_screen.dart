import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/exam/presentation/exam_screen.dart';
import 'package:x_market/src/features/iniatial/controller/initial_controller.dart';
import 'package:x_market/src/features/iniatial/presentation/widget/carousel_widget.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';

import '../../../widgets/profile_image.dart';

class InitialScreen extends StatefulWidget {
  static const route = r'/initial';

  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitialController>(
      init: InitialController(),
      builder:(controller)=> SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(Icons.arrow_back_ios_new)),
                                 Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: const Text(
                                    'Beginner',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const ProfileImageWidget(),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            const CarouselWidget(),
                            SizedBox(height: 20.h),
                            Container(
                              width: 330.w,
                              height: 165.h,
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Synanşyklar',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                   SizedBox(
                                    height: 7.h ,
                                  ),
                                  const Text(
                                      'Sorag jogaplaryň jemi 10 sanysy bolar, soraglar wagtynda ýerine ýetirilmedik ýagdaýynda ýene 2 synanşygyňyzy ulanyp bilersiňiz.Siz synaga girmäge taýýarmy?',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Galan synanşyk sany: 2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green.shade500)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                             SizedBox(height: 200.h),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // backgroundColor:
                                    //     Theme.of(context).colorScheme.background,
                                  ),
                                  onPressed: () {
                                    Get.to(() => const ExamScreen());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Soraglara gecmek'.tr,
                                        style: const TextStyle(fontSize: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }
}
