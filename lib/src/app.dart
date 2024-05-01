import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:x_market/src/features/home/presentation/home_screen.dart';
import 'package:x_market/src/features/iniatial/controller/initial_controller.dart';
import 'package:x_market/src/features/iniatial/presentation/initial_screen.dart';
import 'package:x_market/src/features/login/presentation/login_screen.dart';
import 'package:x_market/src/features/profile/presentation/profile_screen.dart';
import 'package:x_market/src/features/profile_settings/controllers/profile_settings_controller.dart';
import 'package:x_market/src/features/rate/presentation/rate_screen.dart';
import 'package:x_market/src/features/settings/presentation/settings_screen.dart';
import 'core/globals.dart';
import 'features/account/controllers/auth_controller.dart';
import 'features/account/repository/auth_repository.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';
import 'features/profile_settings/presentation/profile_settings_screen.dart';
import 'features/register/presentation/register_screen.dart';
import 'localization/controller/language_controller.dart';
import 'localization/localization_service.dart';
import 'theme/app_theme.dart';
import 'theme/controller/theme_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final localizationService = LocalizationService();
  final _box = GetStorage();

  ThemeMode _initThemeMode() {
    bool? isDarkMode = _box.read<bool>(r'theme');
    isDarkMode ??= false;

    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child)=>GetMaterialApp(
        title: 'Gurlushyk',
        localizationsDelegates: LocalizationService.localizationsDelegate(),
        locale: localizationService.getLocale(),
        fallbackLocale: LocalizationService.fallbackLocale,
        translations: localizationService,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: _initThemeMode(),
        initialRoute: DashboardScreen.route,
        initialBinding: DashboardBinding(),
        getPages: [
          GetPage(
            name: DashboardScreen.route,
            page: () => const DashboardScreen(),
          ),
          GetPage(
            name: HomeScreen.route,
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: RateScreen.route,
            page: () => const RateScreen(),
          ),
          GetPage(
            name: ProfileScreen.route,
            page: () => const ProfileScreen(),
          ),
          GetPage(
            name: RegisterScreen.route,
            page: () => const RegisterScreen(),
          ),
          GetPage(
            name: LoginScreen.route,
            page: () => const LoginScreen(),
          ),
          GetPage(
            name: InitialScreen.route,
            page: () => const InitialScreen(),
          ),
          GetPage(
            name: SettingsScreen.route,
            page: () => const SettingsScreen(),
          ),
          GetPage(
            name: ProfileSettingsScreen.route,
            page: () => const ProfileSettingsScreen(),
          ),
        ],
      ),
    );
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    final apiService = ApiServices.apiService;

    Get.put(ThemeController(), permanent: true);
    Get.put(LanguageController(), permanent: true);
    Get.put(InitialController(), permanent: true);
    Get.put(ProfileSettingsController(), permanent: true);
    Get.put(
        AuthController(authRepository: AuthRepository(apiService: apiService)),
        permanent: true);

  }
}
