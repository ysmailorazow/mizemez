import 'package:get/get.dart';

import '../model/grid_model.dart';

class HomeController extends GetxController {
  // RxList grid = [].obs;
  List<GridModel> grid = <GridModel>[].obs;

  void _getGrid() {
    grid  = GridModel.getGrid();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getGrid();
    update();
  }
}
