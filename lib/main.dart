import 'package:brother_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:brother_admin_panel/localization/language_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  // تهيئة GetStorage
  await GetStorage.init();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyD9UQWdfrV9oWjMYsGjqD8ToxRK-Jx0IxQ',
        appId: '1:9527223797:android:7ff0fec7a325c921996cbc',
        messagingSenderId: '9527223797',
        projectId: 'brothers-creative'),
  ).then((value) => Get.put(AuthenticationRepository()));

  // تهيئة مدير اللغة
  Get.put(LanguageController());

  runApp(const App());
}
