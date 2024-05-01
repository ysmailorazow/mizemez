import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:x_market/src/features/iniatial/controller/initial_controller.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activeIndex = 0;
  Widget buildIndicator() => Container(
    width: 270.w,
    height: 10.h,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow.shade200),
    child: AnimatedSmoothIndicator(

      activeIndex: activeIndex,
      count: 3,
      effect:  SlideEffect(
        dotColor: Colors.yellow.shade100,
        activeDotColor: Colors.yellow.shade500,
        dotWidth: 90,
        dotHeight: 15,
        spacing: 0,
        radius: 10,

      ),
    ),
  );
  @override
  Widget build(BuildContext context) {

    return  GetBuilder<InitialController>(
      init: InitialController(),
      builder: (controller) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: controller.carousel.length,
              itemBuilder:
                  (BuildContext context, int index,
                  int realIndex) {
                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 330.w,
                    height: 150.h,
                    child: Image.asset(controller.carousel[index].image ??'', fit: BoxFit.cover,height: 150.h, width: 350.w,),
                  ),
                );
              },
              options: CarouselOptions(
                  autoPlay: true,
                  height: 150.h,

                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index)
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            Center(child: buildIndicator()),
          ],
        );
      }
    );

  }
}
