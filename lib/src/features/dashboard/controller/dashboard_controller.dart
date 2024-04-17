import 'package:get/get.dart';

import '../utils/nested_nav_ids.dart';

class DashboardController extends GetxController {
  ///Current index of navigation page.
  final RxInt _currentIndex = 0.obs;

  ///Flag to check whether search bar is expanded or not.
  final RxBool _searchBarExpanded = false.obs;

  ///Getter for current index.
  int get currentIndex => _currentIndex.value;

  ///Getter for getting search bar expanded flag.
  bool get searchBarExpanded => _searchBarExpanded.value;

  ///Update current index due to selection.
  ///
  ///This method used on bottom navigation or top navigation tapped.
  ///Variable currentIndex used to change current page index of navigation.
  void updateCurrentIndex(int currentIndex) async {
    int keyIdForPosition = _getKeyIdForPosition(_currentIndex.value);
    if (_currentIndex.value == currentIndex) {
      Get.keys[keyIdForPosition]?.currentState!.popUntil((r) => r.isFirst);
    } else {
      _currentIndex.value = currentIndex;
    }
  }

  ///Method responsible for handling back tapping event
  Future<bool> onWillPop() async {
    int keyIdForPosition = _getKeyIdForPosition(_currentIndex.value);
    if (keyIdForPosition != -1) {
      bool handled = await Get.keys[keyIdForPosition]!.currentState!.maybePop();
      if (handled) {
        return false;
      }
    }
    if (_currentIndex.value != 0) {
      _currentIndex.value = 0;
      return false;
    }
    return true;
  }

  ///Method to getting id from selected navigation index.
  ///
  ///NestedNavigationIds is different from
  ///DashboardNavigationIndex, NestedNavigationIds could take any
  ///random int.
  int _getKeyIdForPosition(int position) {
    switch (position) {
      case DashboardNavigationIndex.home:
        return NestedNavigationIds.home;

      case DashboardNavigationIndex.rate:
        return NestedNavigationIds.rate;

      // case DashboardNavigationIndex.others:
      //   return NestedNavigationIds.others;
      //
      // case DashboardNavigationIndex.cart:
      //   return NestedNavigationIds.cart;

      case DashboardNavigationIndex.profile:
        return NestedNavigationIds.profile;

      default:
        return -1;
    }
  }
}
