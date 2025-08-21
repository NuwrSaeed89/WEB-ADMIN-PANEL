import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();

  final _storage = GetStorage();
  final _key = 'isDarkMode';

  bool get isDarkMode {
    return _storage.read(_key) ?? false;
  }

  ThemeMode get themeMode {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final newValue = !isDarkMode;
    _storage.write(_key, newValue);
    Get.changeThemeMode(newValue ? ThemeMode.dark : ThemeMode.light);
    update(); // إخطار GetBuilder بالتغييرات
  }

  void setThemeMode(ThemeMode mode) {
    final isDark = mode == ThemeMode.dark;
    _storage.write(_key, isDark);
    Get.changeThemeMode(mode);
    update(); // إخطار GetBuilder بالتغييرات
  }

  @override
  void onInit() {
    super.onInit();
    // تطبيق الوضع المحفوظ عند بدء التطبيق
    Get.changeThemeMode(themeMode);
  }
}
