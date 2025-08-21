import 'package:brother_admin_panel/routs/app_routes.dart';
import 'package:brother_admin_panel/routs/routs.dart';
import 'package:brother_admin_panel/utils/themes/theme.dart';
import 'package:brother_admin_panel/utils/controllers/theme_controller.dart';
import 'package:brother_admin_panel/features/dashboard/controllers/dashboard_controller.dart';
import 'package:brother_admin_panel/localization/language_controller.dart';
import 'package:brother_admin_panel/localization/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants/text_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print('App build called');

    // تهيئة ThemeController
    Get.put(ThemeController());

    // تهيئة DashboardController
    final dashboardController = Get.put(DashboardController());
    print('DashboardController created: $dashboardController');
    print(
        'DashboardController currentScreen: ${dashboardController.currentScreen.value}');

    return GetMaterialApp(
      title: TTexts.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // سيتم تحديثه بواسطة المتحكم
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      
      // إعدادات الترجمة
      translations: AppTranslations(),
      locale: LanguageController.to.locale,
      fallbackLocale: const Locale('en'),
      
      getPages: TAppRoute.pages,
      initialRoute: TRoutes.login,
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => const Scaffold(
                body: Center(
                  child: Text(
                    'Page Not Found',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              )),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          const Text(
            'Simple navigation Navigator Vs GetX ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
                },
                child: const Text("Default Navigation")),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const SecondScreen()),
                child: const Text("GetX  Navigation")),
          ),
          const Text(
            'Named  navigation Navigator Vs GetX ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist'),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second-screen');
                },
                child: const Text("Default  Named Navigation")),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () => Get.toNamed('/second-screen'),
                child: const Text("GetX Named Navigation")),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Pass data with named  navigation Vs GetX ',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist'),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second-screen');
                },
                child: const Text("Default  Named Navigation")),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () => Get.toNamed('/second-screen'),
                child: const Text("GetX Named Navigation")),
          ),
        ],
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Second Screen'),
      centerTitle: true,
    ));
  }
}
