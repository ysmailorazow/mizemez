import 'dart:core';

import 'package:flutter/cupertino.dart';

import '../../../utils/constants/app_assets.dart';

class CarouselModel {
  final String image;

  CarouselModel({required this.image});

  static List<CarouselModel> getCarousel() {
    List<CarouselModel> carousel = [];

    carousel.add(
      CarouselModel(
        image: AppAssets.carousel,
      ),
    );
    carousel.add(
      CarouselModel(
        image: AppAssets.carousel2,
      ),
    );
    carousel.add(
      CarouselModel(
        image: AppAssets.carousel,
      ),
    );


    return carousel;
  }
}
