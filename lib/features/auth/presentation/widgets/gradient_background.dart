// Gradient Background
import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/utils/screen_util_new.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtilNew.height(812),
      width: ScreenUtilNew.width(375),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}