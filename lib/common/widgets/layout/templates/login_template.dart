import 'package:brother_admin_panel/common/styles/spacing_style.dart';
import 'package:brother_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
            child: Container(
                padding: TSpacingStyle.paddingWithAppbarHeight,
                decoration: BoxDecoration(
                    gradient: Theme.of(context).brightness == Brightness.dark
                        ? const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 20, 40, 120),
                              Color.fromARGB(255, 10, 20, 60),
                              Color.fromARGB(255, 60, 100, 150),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 38, 78, 255),
                              Color(0x0fffffff),
                              Color.fromARGB(255, 145, 214, 235),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
                child: child)),
      ),
    );
  }
}
