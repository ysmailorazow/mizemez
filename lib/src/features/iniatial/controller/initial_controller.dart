import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/carousel_model.dart';

class InitialController extends GetxController {
  List<CarouselModel> carousel = <CarouselModel>[].obs;

  void _getCarousel() {
    carousel  = CarouselModel.getCarousel();
  }

  @override
  void onInit() {
    super.onInit();
    _getCarousel();
    update();
  }
}