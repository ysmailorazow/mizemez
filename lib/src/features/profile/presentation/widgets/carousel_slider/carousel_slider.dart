import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../../theme/constants/app_dimensions.dart';
import '../../../../../widgets/cached_image.dart';
import 'carousel_slider_indicator.dart';

class CarouselSlider extends StatefulWidget {
  final List<String>? stringImages;
  final bool isStack;
  final double? height;
  final BoxFit boxFit;
  final void Function(int value)? onTap;

  const CarouselSlider({
    super.key,
    this.stringImages,
    this.isStack = false,
    this.height,
    this.boxFit = BoxFit.cover,
    this.onTap,
  });

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int bannerIndex = 0;
  late Timer timer;
  final _controller = PageController(initialPage: 0);

  List images = [];

  @override
  void initState() {
    super.initState();
    images = widget.stringImages ?? [];
    if (images.length <= 1) {
      timer = Timer(Duration.zero, () {});
    } else {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        _controller.nextPage(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOutCubic);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty
        ? widget.isStack
            ? Stack(children: [
                _getImages(),
                Positioned(bottom: 0.0, left: 0.0, child: _getIndicators()),
              ])
            : Column(
                children: [_getImages(), _getIndicators()],
              )
        : const SizedBox();
  }

  Widget _getImages() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: Center(
        child: PageView.builder(
          controller: _controller,
          physics: images.length <= 1
              ? const NeverScrollableScrollPhysics()
              : const PageScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              bannerIndex = value % images.length;
            });
          },
          itemBuilder: (context, index) {
            final rawImage = images[index % images.length];

            return GestureDetector(
              onTap: () {
                widget.onTap!(bannerIndex);
              },
              child: CachingImage(
                rawImage,
                fit: widget.boxFit,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _getIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingExtraLarge,
          vertical: AppDimensions.paddingSmall),
      child: SizedBox(
        height: 15.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            images.length,
            (index) => CarouselSliderIndicator(
                dotIndex: index % images.length, bannerIndex: bannerIndex),
          ),
        ),
      ),
    );
  }
}
