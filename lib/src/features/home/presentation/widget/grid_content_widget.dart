import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:x_market/src/features/home/controller/home_controller.dart';
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
              // onTap: () {
              //   Get.toNamed(RateScreen.route,
              //       arguments: {'grid_id': controller.grid[index].id});
              // },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.7, color: AppColors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  width: 150,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 8,
                        child: Container(
                          width: 190,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                          border: Border.all(width: 0.5, color: AppColors.grey),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          color: controller.grid[index].boxColor,
                        ),
                        child: Stack(
                          children: [
                            Image(
                              image: AssetImage(controller.grid[index].image),
                              fit: BoxFit.contain,
                              height: 100,
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
