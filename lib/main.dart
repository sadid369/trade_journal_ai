import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'utils/static_strings/static_strings.dart';
import 'core/routes/routes.dart';
import 'dependency_injection/getx_injection.dart';
import 'global/language/controller/language_controller.dart';
import 'utils/app_colors/app_colors.dart';

late final List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize LanguageController and load saved language
  final LanguageController languageController = Get.put(
    LanguageController(),
  );
  await languageController.getLanguageType();

  runApp(const MyApp());
  initGetx();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find();

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (_, __) {
        return Obx(
          () => GetMaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              primaryColor: AppColors.primary,
              primarySwatch: AppColors
                  .primarySwatch, // Replace with your desired MaterialColor
              useMaterial3: true,
            ),
            translations: Language(), // your translations class
            locale: languageController.selectedLanguage.value == "Spanish"
                ? const Locale('es', 'ES')
                : const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            routeInformationParser: AppRouter.route.routeInformationParser,
            routerDelegate: AppRouter.route.routerDelegate,
            routeInformationProvider: AppRouter.route.routeInformationProvider,
          ),
        );
      },
    );
  }
}
