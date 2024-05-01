import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';

class ExamController extends GetxController {

  int secondsRemaining = 60;
  Color timerColor = AppColors.green;

  List<String> items = [
    "1-nji sorag",
    "2-nji sorag",
    "3-nji sorag",
    "4-nji sorag",
    "5-nji sorag",
    "6-njy sorag",
    "7-nji sorag",
    "8-nji sorag",
    "9-njy sorag",
    "10-njy sorag",
  ];
  int current = 0;



  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        if (secondsRemaining == 10) {
          timerColor = Colors.red; // Change color to red
        }
        update();
      } else {
        timer?.cancel();
      }
    });
  }


  @override
  void onInit() {
    super.onInit();
    startTimer();

  }
}