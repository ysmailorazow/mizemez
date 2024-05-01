import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/exam/controller/exam_controller.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';
import 'package:x_market/src/widgets/profile_image.dart';
import '../../../theme/constants/app_dimensions.dart';

class ExamScreen extends StatefulWidget {
  static const route = r'/exam';

  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GetBuilder<ExamController>(
            init: ExamController(),
            builder: (controller) {
              return CustomScrollView(slivers: [
                 SliverList(
                    delegate: SliverChildListDelegate([
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
                                child: Text(
                                  'Beginner',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              const ProfileImageWidget(),
                            ],
                          ),
                           SizedBox(height: 10.h),
                          Container(
                            height: 55.h,
                            width: double.infinity,
                            color: AppColors.white,
                            child: ListView.builder(
                              itemCount: controller.items.length,
                              scrollDirection: Axis.horizontal,
                              padding:  EdgeInsets.symmetric(horizontal: 5.w),
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller.current = index;
                                    });
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.all(5.r),
                                    child: AnimatedContainer(
                                        duration: const Duration(microseconds: 300),
                                        height: 40.h,
                                        width: 95.w,
                                        decoration: BoxDecoration(
                                            color: controller.current == index
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                controller.current == index
                                                    ? BorderRadius.circular(12.r)
                                                    : BorderRadius.zero),
                                        child: Center(
                                            child: Text(
                                          controller.items[index],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: controller.current == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ))),
                                  ),
                                );
                              },
                            ),
                          ),
                           SizedBox(height: 20.r),
                           SizedBox(
                            width: 310.w,
                            child:  Text(
                                'Aşakdaky söz iňlis dilinde nähili ýazylýar?',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 20.sp, fontWeight: FontWeight.bold)),
                          ),
                           SizedBox(height: 20.h),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onBackground,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            width: 330.w,
                            height: 60.h,
                            child:  Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Text('Men düýn oba gitdim.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 14.sp)),
                            ),
                          ),
                           SizedBox(height: 30.h),
                          SizedBox(
                            width: 330.w,
                            height: 130.h,
                            child: TextFormField(
                              maxLines: 6,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  fillColor: Theme.of(context).colorScheme.onBackground,
                                  contentPadding:  EdgeInsetsDirectional.all(14.r),
                                  disabledBorder:  OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.transparent),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12.r))),
                                  hintText: 'Yesterday I go to my village.'.tr,
                                  hintStyle:  TextStyle(fontSize: 16.sp)),
                            ),
                          ),
                           SizedBox(height: 15.h),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onBackground,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            width: 330.w,
                            height: 130.h,
                            child:  Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Text('Men düýn oba gitdim.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 14.sp)),
                            ),
                          ),
                           SizedBox(height: 15.h),
                          SizedBox(
                              width: 330.h,
                              height: 35.h,
                              child: Text(
                                '${controller.secondsRemaining} seconds',
                                textAlign: TextAlign.left,
                              )),
                           SizedBox(height: 8.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: SizedBox(
                              width: 330.w,
                              height: 6.h,
                              child:
                                  // Transform(
                                  //   alignment: Alignment.center,
                                  //   transform: Matrix4.identity()
                                  // //     ..scale(-1.0, -1.0),
                                  //   child:
                                  LinearProgressIndicator(
                                value: (60 - controller.secondsRemaining) / 60,
                                backgroundColor: Colors.grey,
                                valueColor:
                                    AlwaysStoppedAnimation(controller.timerColor),
                              ),
                              // ),
                            ),
                          ),
                           SizedBox(height: 20.h),
                          Padding(
                            padding:  EdgeInsets.all(22.r),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22.r),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                ),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Indiki sorag'.tr,
                                      style:  TextStyle(fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),

              ]);
            }),
      ),
    );
  }
}
