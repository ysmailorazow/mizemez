import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/home/controller/home_controller.dart';
import 'package:x_market/src/features/iniatial/presentation/initial_screen.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';

class GridContentWidget extends StatefulWidget {
  const GridContentWidget({super.key});

  @override
  State<GridContentWidget> createState() => _GridContentWidgetState();
}

class _GridContentWidgetState extends State<GridContentWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
          ),
          itemCount: controller.grid.length,
          itemBuilder: (BuildContext context, int index) {
            // final grids = controller.grid[index];
            return InkWell(
              onTap: () {
                Get.toNamed(InitialScreen.route);
              },
              child: Padding(
                padding:  EdgeInsets.all(10.r),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.7.r, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  width: 155.w,
                  height: 210.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 8,
                        child: Container(
                          width: 160.w,
                          height: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(10.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.grid[index].name ?? ''),
                                const Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Level:'),
                                    Text(controller.grid[index].level ?? ''),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5.r, color: AppColors.grey),
                          borderRadius:  BorderRadius.only(
                            topRight: Radius.circular(10.r),
                            topLeft: Radius.circular(10.r),
                          ),
                          color: controller.grid[index].boxColor,
                        ),
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(controller.grid[index].image),
                              fit: BoxFit.contain,
                              height: 80.h,
                              width: double.maxFinite,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
