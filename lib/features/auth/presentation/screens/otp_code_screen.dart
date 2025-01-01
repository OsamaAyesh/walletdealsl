import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:walletdeals/core/routes/app_routes.dart';
import 'package:walletdeals/core/utils/context_extension.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/routes/assets_manager.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../widgets/backbutton_title.dart';
import '../widgets/gradient_background.dart';
import '../widgets/resender_timer.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // Timer-related variables
  int _secondsRemaining = 120;
  late Timer _timer;

  // OTP input controller
  final TextEditingController _otpController = TextEditingController();

  // Button state (enabled/disabled)
  bool _isButtonEnabled = false;

  // Predefined OTP (this could be fetched from an API in a real app)
  final String _correctOtp = "123457";

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the timer on screen load
  }

  // Function to start the timer and decrement the seconds
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isButtonEnabled = false; // Disable the button when timer reaches zero
        });
        _timer.cancel(); // Cancel the timer when it reaches zero
      }
    });
  }

  // Update button state based on OTP input length and timer
  void _onOtpChanged() {
    setState(() {
      // Enable button only if OTP length is 6 and timer is still running
      _isButtonEnabled = _otpController.text.length == 6 && _secondsRemaining > 0;
    });
  }

  // Handle OTP verification
  void _verifyOtp() {
    final enteredOtp = _otpController.text;

    if (enteredOtp == _correctOtp) {
      // OTP is correct
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("OTP Verified Successfully!")),
      // );
      showCustomDialogSuccess(context);
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushReplacementNamed(context, AppRoutes.editPasswordScreen);
      });

      // Navigate to the next screen or perform some other action
    } else {
      // OTP is incorrect
      showCustomDialogError(context);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Incorrect OTP, please try again.")),
      // );
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    _otpController.dispose(); // Dispose the OTP controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Gradient background widget
          const GradientBackground(),

          // Main content
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtilNew.height(48),
              bottom: ScreenUtilNew.height(16),
            ),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                height: ScreenUtilNew.height(736),
                width: ScreenUtilNew.width(343),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildBackButtonWithTitle(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildImageOnOtpImage(),
                      SizedBox(height: ScreenUtilNew.height(20)),
                      _buildPhoneImage(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildTextWidget(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildWidgetOtp(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildResenderCode(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildVerifyButton(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Back button with title
  Widget _buildBackButtonWithTitle() {
    return BackButtonWithTitle(
      title: context.localizations.verification_code_text1,
    );
  }

  // Verification illustration
  Widget _buildImageOnOtpImage() {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(
        AssetsManager.vertified,
        height: ScreenUtilNew.height(260),
        width: ScreenUtilNew.width(290),
        fit: BoxFit.contain,
      ),
    );
  }

  // Phone message icon
  Widget _buildPhoneImage() {
    return SvgPicture.asset(AssetsManager.phoneMessage);
  }

  // Instruction text
  Widget _buildTextWidget() {
    return Text(
      context.localizations.verification_code_text2,
      style: GoogleFonts.cairo(
        fontSize: 12.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }

  // OTP input field
  Widget _buildWidgetOtp() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        controller: _otpController,
        length: 6,
        defaultPinTheme: _buildPinTheme(),
        focusedPinTheme: _buildFocusedPinTheme(),
        submittedPinTheme: _buildSubmittedPinTheme(),
        onCompleted: (pin) => _onOtpChanged(),
        onChanged: (pin) => _onOtpChanged(),
      ),
    );
  }

  // Default Pin Theme
  PinTheme _buildPinTheme() {
    return PinTheme(
      width: ScreenUtilNew.width(38),
      height: ScreenUtilNew.height(38),
      textStyle: GoogleFonts.cairo(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  // Focused Pin Theme
  PinTheme _buildFocusedPinTheme() {
    return PinTheme(
      width: ScreenUtilNew.width(48),
      height: ScreenUtilNew.height(48),
      textStyle: GoogleFonts.cairo(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  // Submitted Pin Theme
  PinTheme _buildSubmittedPinTheme() {
    return PinTheme(
      width: ScreenUtilNew.width(42),
      height: ScreenUtilNew.height(42),
      textStyle: GoogleFonts.cairo(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  // Resend code button and timer
  Widget _buildResenderCode() {
    return ResendAndTimer(
      secondsRemaining: _secondsRemaining,
      onResend: () {
        setState(() {
          _secondsRemaining = 120; // Reset the timer
          _startTimer(); // Start a new timer
        });
      },
    );
  }

  // Verify button
  Widget _buildVerifyButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: ElevatedButton(
        onPressed: _isButtonEnabled ? _verifyOtp : null, // Only call verifyOtp if button is enabled
        style: ElevatedButton.styleFrom(
          backgroundColor: _isButtonEnabled
              ? AppColors.primary // Active button color
              : AppColors.greyColor, // Inactive button color
          minimumSize: Size(double.infinity, ScreenUtilNew.height(52)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          context.localizations.verification_code_text4,
          style: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  void showCustomDialogError(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0XFFD9D9D9).withOpacity(0.55),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // الزوايا المستديرة
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // 80% من عرض الشاشة
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtilNew.width(16),
                vertical: ScreenUtilNew.height(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetsManager.errorAnimationImage,
                    height: ScreenUtilNew.height(89),
                    width: ScreenUtilNew.width(89),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: ScreenUtilNew.height(4)),
                  Text(
                    context.localizations.error_dialog_in_sign_in1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFC01A1A),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(4)),
                  Text(
                    context.localizations.error_dialog_in_sign_in2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF8C9191),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: ScreenUtilNew.height(24)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFFC01A1A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      minimumSize: Size(double.infinity, ScreenUtilNew.height(47)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // إغلاق الـ Dialog
                    },
                    child: Text(
                      context.localizations.error_dialog_in_sign_in3,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  void showCustomDialogSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color(0XFFD9D9D9).withOpacity(0.55),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // الزوايا المستديرة
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // 80% من عرض الشاشة
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtilNew.width(16),
                vertical: ScreenUtilNew.height(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetsManager.successAnimation,
                    height: ScreenUtilNew.height(89),
                    width: ScreenUtilNew.width(89),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: ScreenUtilNew.height(4)),
                  Text(
                    context.localizations.success_dialog_in_sign_in1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF39C67E),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(4)),
                  Text(
                    context.localizations.success_dialog_in_sign_in2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF8C9191),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: ScreenUtilNew.height(24)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
