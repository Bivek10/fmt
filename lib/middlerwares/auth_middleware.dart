import 'package:flutter/material.dart';
import 'package:fmt/app/routes/app_pages.dart';
import 'package:fmt/utils/memory_management.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    try {
      if (MemoryManagement.getFirebaseToken() == null) {
        return const RouteSettings(name: Routes.SPLASH);
      }
    } catch (e) {
      return const RouteSettings(name: Routes.SPLASH);
    }
    return null;
  }
}
