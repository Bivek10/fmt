import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/global_constants.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:fmt/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await MemoryManagement.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            title: "Farm Tool",
            getPages: AppPages.routes,
            initialRoute: AppPages.INITIAL,
            defaultTransition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500),
            home: child,
          );
        });
  }
}
