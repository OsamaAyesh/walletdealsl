import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/config/theme/colors.dart';
import 'package:walletdeals/core/errors/screens/error_internet.dart';
import 'package:walletdeals/core/utils/context_extension.dart';

import '../../../../core/utils/screen_util_new.dart';

class ResendAndTimer extends StatelessWidget {
  final int secondsRemaining;
  final VoidCallback onResend;

  const ResendAndTimer({
    required this.secondsRemaining,
    required this.onResend,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: ScreenUtilNew.width(90)),
        GestureDetector(
          onTap: onResend,
          child: Text(
            context.localizations.verification_code_text3,
            style: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
          ),
        ),
        SizedBox(width: ScreenUtilNew.width(90)),
        Text(
          '$secondsRemaining',
          style: GoogleFonts.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          )
        ),
      ],
    );
  }
}
