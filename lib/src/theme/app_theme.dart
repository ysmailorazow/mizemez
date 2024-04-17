import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_text_theme.dart';

import 'constants/app_colors.dart';
import 'constants/app_dimensions.dart';

class AppTheme {
  static const _singleton = AppTheme._();

  factory AppTheme() => _singleton;

  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.extraLightGrey,
    appBarTheme: const AppBarTheme(
      color: AppColors.green,
      centerTitle: true,
      elevation: 1.0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 24.0,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.green,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.green,
      onPrimary: AppColors.white,
      background: AppColors.extraLightGrey,
      surface: AppColors.lightBlueGrey,
      secondary: AppColors.lightGreen,
      tertiary: AppColors.grey,
      shadow: AppColors.lightGrey,
      primaryContainer: AppColors.brown,
      secondaryContainer: AppColors.white,
      surfaceVariant: AppColors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusLarge,
          ),
        ),
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.extraLightGrey,
        fixedSize: const Size.fromHeight(AppDimensions.buttonHeight),
        elevation: 1.0,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.green,
      foregroundColor: AppColors.white,
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return AppColors.green;
      }),
      trackColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return AppColors.white;
      }),
      trackOutlineColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return AppColors.green;
      }),
    ),
    dividerColor: AppColors.lightGreen,
    dividerTheme: const DividerThemeData(
      color: AppColors.lightGreen,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.robotoTextTheme().bodySmall?.copyWith(
            fontSize: 12.0,
          ),
      // hintStyle: GoogleFonts.robotoTextTheme().bodySmall,
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusMedium),
            right: Radius.circular(AppDimensions.borderRadiusMedium),
          )),
      filled: true,
      fillColor: AppColors.lightGreen,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.lightGreen,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusMedium),
            right: Radius.circular(AppDimensions.borderRadiusMedium),
          )),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.lightGreen,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusMedium),
            right: Radius.circular(AppDimensions.borderRadiusMedium),
          )),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.green,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: const Size.fromHeight(AppDimensions.buttonHeight),
        foregroundColor: AppColors.green,
        side: const BorderSide(color: AppColors.green),
      ),
    ),
    textTheme: AppTextTheme().lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkGrey,
    appBarTheme: const AppBarTheme(
      color: AppColors.green,
      centerTitle: true,
      elevation: 1.0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 24.0,
      ),
      iconTheme: IconThemeData(color: AppColors.extraLightGrey),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.green,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.borderRadiusLarge,
          ),
        ),
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.extraLightGrey,
        fixedSize: const Size.fromHeight(AppDimensions.buttonHeight),
        elevation: 1.0,
      ),
    ),
    dividerColor: AppColors.lightGreen,
    dividerTheme: const DividerThemeData(
      color: AppColors.lightGreen,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.robotoTextTheme(
        ThemeData.dark().textTheme,
      ).bodySmall?.copyWith(
            color: AppColors.black,
            fontSize: 12.0,
          ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusMedium),
            right: Radius.circular(AppDimensions.borderRadiusMedium),
          )),
      filled: true,
      fillColor: AppColors.lightGreen,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.lightGreen,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusMedium),
            right: Radius.circular(AppDimensions.borderRadiusMedium),
          )),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppColors.lightGreen,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(AppDimensions.borderRadiusMedium),
            right: Radius.circular(AppDimensions.borderRadiusMedium),
          )),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.green,
      foregroundColor: AppColors.white,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: const Size.fromHeight(AppDimensions.buttonHeight),
        foregroundColor: AppColors.lightGreen,
        side: const BorderSide(color: AppColors.lightGreen),
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.green,
      onPrimary: AppColors.white,
      background: AppColors.black,
      surface: AppColors.darkGrey,
      secondary: AppColors.lightGreen,
      tertiary: AppColors.white,
      shadow: AppColors.lightBlack,
      primaryContainer: AppColors.brown,

      // primaryContainer: AppColors.amberAccent,
      secondaryContainer: AppColors.lightBlack,
      surfaceVariant: AppColors.white,
    ),
    // scaffol
    textTheme: AppTextTheme().darkTheme,
    // fontFamily: r'Poppins',
  );
}
