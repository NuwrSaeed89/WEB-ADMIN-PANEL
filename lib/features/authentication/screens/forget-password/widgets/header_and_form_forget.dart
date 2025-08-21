import 'package:brother_admin_panel/common/widgets/layout/templates/login_template.dart';
import 'package:brother_admin_panel/routs/routs.dart';
import 'package:brother_admin_panel/utils/constants/sizes.dart';
import 'package:brother_admin_panel/utils/constants/text_strings.dart';
import 'package:brother_admin_panel/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndFormWidget extends StatelessWidget {
  const HeaderAndFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Header
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Iconsax.arrow_left)),
          const SizedBox(
            height: TSizes.spaceBtWItems,
          ),
          Text(
            TTexts.forgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: TSizes.spaceBtWItems,
          ),
          Text(
            TTexts.forgetPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: TSizes.spaceBtWsections * 2,
          ),

          ///Form
          Form(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(
                  Iconsax.direct_right,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? TColors.white
                      : TColors.black,
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? TColors.white
                      : TColors.black,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                  borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? TColors.white.withValues(alpha: 0.3)
                        : TColors.borderPrimary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                  borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? TColors.primary
                        : TColors.black,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtWsections,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.toNamed(TRoutes.resetPassword,
                    arguments: 'Nuwar.m.saeed@gmail.com'),
                child: const Text('Submit')),
          ),
          const SizedBox(
            height: TSizes.spaceBtWsections * 2,
          ),
        ],
      ),
    );
  }
}
