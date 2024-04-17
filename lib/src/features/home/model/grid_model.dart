import 'package:flutter/material.dart';
import 'package:x_market/src/theme/constants/app_colors.dart';
import 'package:x_market/src/utils/constants/app_assets.dart';

class GridModel {
  String level;
  String icon;
  String image;
  String name;
  int id;
  Color boxColor;

  GridModel({
    required this.level,
    required this.icon,
    required this.image,
    required this.name,
    required this.id,
    required this.boxColor,
  });

  static List<GridModel> getGrid() {
    List<GridModel> grid = [];

    grid.add(
      GridModel(
        level: 'A1',
        icon: AppAssets.star_icon,
        image: AppAssets.beginner,
        name: 'Beginner',
        id: 1,
        boxColor: AppColors.beginner_color,
      ),
    );
    grid.add(
      GridModel(
        level: 'A2',
        icon: AppAssets.star_icon,
        image: AppAssets.elementary,
        name: 'Elementary',
        id: 2,
        boxColor: AppColors.elementary_color,
      ),
    );
    grid.add(
      GridModel(
        level: 'B1',
        icon: AppAssets.star_icon,
        image: AppAssets.pre_inter,
        name: 'Pre-intermediate',
        id: 3,
        boxColor: AppColors.pre_inter_color,
      ),
    );
    grid.add(
      GridModel(
        level: 'B2',
        icon: AppAssets.star_icon,
        image: AppAssets.inter,
        name: 'Intermediate',
        id: 4,
        boxColor: AppColors.inter_color,
      ),
    );
    grid.add(
      GridModel(
        level: 'C1',
        icon: AppAssets.star_icon,
        image: AppAssets.upper,
        name: 'Upper',
        id: 5,
        boxColor: AppColors.upper_color,
      ),
    );
    grid.add(
      GridModel(
        level: 'C2',
        icon: AppAssets.star_icon,
        image: AppAssets.advanced,
        name: 'Advanced',
        id: 6,
        boxColor: AppColors.advanced_color,
      ),
    );
    return grid;
  }
}
