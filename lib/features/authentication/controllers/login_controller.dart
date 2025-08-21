import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brother_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:brother_admin_panel/utils/helpers/snackbar_helper.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final privacyPolicy = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// دالة تسجيل الدخول باستخدام Firebase Auth
  Future<void> emailAndPasswordSignin() async {
    try {
      // التحقق من صحة النموذج
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // حفظ بيانات "تذكرني" إذا كان مفعلاً
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // استخدام Firebase Auth لتسجيل الدخول
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      if (userCredential != null && userCredential.user != null) {
        // نجح تسجيل الدخول
        Get.offAllNamed('/dashboard');
        SnackbarHelper.showSuccess(
          title: 'نجح تسجيل الدخول',
          message: 'مرحباً بك في لوحة التحكم',
        );
      }
    } on FirebaseAuthException catch (e) {
      // معالجة أخطاء Firebase Auth
      String errorMessage = 'حدث خطأ في تسجيل الدخول';

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'البريد الإلكتروني غير مسجل';
          break;
        case 'wrong-password':
          errorMessage = 'كلمة المرور غير صحيحة';
          break;
        case 'invalid-email':
          errorMessage = 'البريد الإلكتروني غير صحيح';
          break;
        case 'user-disabled':
          errorMessage = 'تم تعطيل هذا الحساب';
          break;
        case 'too-many-requests':
          errorMessage = 'تم تجاوز عدد المحاولات المسموح، حاول لاحقاً';
          break;
        default:
          errorMessage = 'خطأ في تسجيل الدخول: ${e.message}';
      }

      SnackbarHelper.showError(
        title: 'خطأ في تسجيل الدخول',
        message: errorMessage,
      );
    } catch (e) {
      SnackbarHelper.showError(
        title: 'خطأ',
        message: 'حدث خطأ أثناء تسجيل الدخول: ${e.toString()}',
      );
    }
  }

  /// تبديل إظهار/إخفاء كلمة المرور
  void togglePasswordVisibility() {
    hidePassword.value = !hidePassword.value;
  }

  /// تبديل "تذكرني"
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  /// تسجيل الخروج
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('/login');
    } catch (e) {
      SnackbarHelper.showError(
        title: 'خطأ',
        message: 'حدث خطأ أثناء تسجيل الخروج: ${e.toString()}',
      );
    }
  }
}

//   Future<void> emailAndPasswordSignin() async {
//     try {
//       TFullScreenLoader.openloadingDialog(
//           AppLocalizations.of(Get.context!)!.processing,
//           TImages.proccessLottie);

//       // check the internet connectivity

//       final isConnected = await NetworkManager.instance.isConnected();
//       if (!isConnected) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//       if (!LoginFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }

//       if (rememberMe.value) {
//         localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
//         localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
//       }
//       final userCredential = await AuthenticationRepository.instance
//           .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
//       TFullScreenLoader.stopLoading();

//       AuthenticationRepository.instance.screenRedirect();
//       //TFullScreenLoader.stopLoading();
//     } catch (e) {
//       TLoader.erroreSnackBar(title: 'Ohh snap', message: e.toString());
//     } finally {
//       TFullScreenLoader.stopLoading();
//     }
//   }
// }
