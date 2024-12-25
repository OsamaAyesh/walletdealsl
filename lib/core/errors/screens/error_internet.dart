import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/config/theme/colors.dart';
import 'package:walletdeals/core/utils/context_extension.dart';

import '../../routes/app_routes.dart';
import '../../routes/assets_manager.dart';
import '../../utils/screen_util_new.dart';

class ErrorInternet extends StatefulWidget {
  const ErrorInternet({super.key});

  @override
  State<ErrorInternet> createState() => _ErrorInternetState();
}

class _ErrorInternetState extends State<ErrorInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: ScreenUtilNew.height(120),
          ),
          _buildImageErrorInternetConnection(),
          SizedBox(
            height: ScreenUtilNew.height(24),
          ),
          _buildTitleText(),
          _buildSubTitleText(),
          const Expanded(child: SizedBox()),
          _buildButtonWidget(),
          SizedBox(
            height: ScreenUtilNew.height(32),
          ),
        ],
      ),
    );
  }

  //Image Error Widget
  Widget _buildImageErrorInternetConnection() {
    return Center(
      child: Image.asset(
        AssetsManager.errorInternetImage,
        height: ScreenUtilNew.height(315),
        width: ScreenUtilNew.width(337),
        fit: BoxFit.contain,
      ),
    );
  }

  //Title Text Widget
  Widget _buildTitleText() {
    return Text(
      context.localizations.error_internet_connection_title,
      style: GoogleFonts.cairo(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary),
    );
  }

  //SubTitle Text Widget
  Widget _buildSubTitleText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(26)),
      child: Text(
        context.localizations.error_internet_connection_subTitle,
        style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0XFF9D9A9B)),
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  //Button Widget
  Widget _buildButtonWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AppRoutes.initialRoute);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: Size(double.infinity, ScreenUtilNew.height(42)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            )),
        child: Text(
          context.localizations.error_internet_connection_buttonText,
          style: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}
