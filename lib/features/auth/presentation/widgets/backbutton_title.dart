import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/utils/screen_util_new.dart';
import 'build_back_button_circle.dart';

class BackButtonWithTitle extends StatelessWidget {
  final String title;

   const BackButtonWithTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtilNew.width(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BuildBackButtonCircle(),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary
              ),
            ),
          ),
          SizedBox(width: ScreenUtilNew.width(32)), 
        ],
      ),
    );
  }
}
