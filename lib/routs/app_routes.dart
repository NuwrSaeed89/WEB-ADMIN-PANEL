import 'package:brother_admin_panel/dashboard.dart';
import 'package:brother_admin_panel/features/authentication/screens/forget-password/forget_password.dart';
import 'package:brother_admin_panel/features/authentication/screens/login/responsive-screens/login.dart';
import 'package:brother_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:brother_admin_panel/routs/route_middleware.dart';
import 'package:get/get.dart';

import 'routs.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.login, page: () => const LoginScreen()),
    GetPage(
        name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(
        name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(
        name: TRoutes.dashboard,
        page: () => const DashboardScreen(),
        middlewares: [TRouteMiddleware()]),
  ];
}
