import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/utils/screen_util_new.dart';
class BuildBackButtonCircle extends StatelessWidget {
  const BuildBackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        height: ScreenUtilNew.height(32),
        width: ScreenUtilNew.width(32),
        decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.16), shape: BoxShape.circle),
        child: const Padding(
          padding: EdgeInsets.all(4),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
