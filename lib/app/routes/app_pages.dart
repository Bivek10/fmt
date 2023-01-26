import 'package:get/get.dart';

import '../../middlerwares/auth_middleware.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/questions/bindings/questions_binding.dart';
import '../modules/questions/views/questions_view.dart';
import '../modules/quizdashboard/bindings/quizdashboard_binding.dart';
import '../modules/quizdashboard/views/quizdashboard_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.QUIZDASHBOARD;
  static const LOGIN = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.QUIZDASHBOARD,
      page: () => const QuizdashboardView(),
      binding: QuizdashboardBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.QUESTIONS,
      page: () => const QuestionsView(),
      binding: QuestionsBinding(),
    ),
  ];
}
