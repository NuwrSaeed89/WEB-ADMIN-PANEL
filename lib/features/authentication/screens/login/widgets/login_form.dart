import 'package:brother_admin_panel/features/authentication/controllers/login_controller.dart';
import 'package:brother_admin_panel/routs/routs.dart';
import 'package:brother_admin_panel/utils/constants/color.dart';
import 'package:brother_admin_panel/utils/constants/sizes.dart';
import 'package:brother_admin_panel/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtWsections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    //border: OutlineInputBorder(),
                    // enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: 'Email'),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Obx(() => TextFormField(
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => TValidator.validatePassword(value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () =>
                                controller.togglePasswordVisibility(),
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye)),
                        labelText: 'Password'),
                  )),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              //remember me and forget password

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) => controller.toggleRememberMe(),
                            activeColor: TColors.primary,
                          )),
                      const Text('Remember me')
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                      child: Text(
                        'Forget Password',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(color: TColors.primary),
                      ))
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              ),

              ///sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignin(),
                    child: const Text('Login')),
              )
            ],
          ),
        ));
  }
}
