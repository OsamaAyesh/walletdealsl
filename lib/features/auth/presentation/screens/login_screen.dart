import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/core/routes/app_routes.dart';
import 'package:walletdeals/core/utils/context_extension.dart';
import 'package:walletdeals/core/validator/validator.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/helpers/logo.dart';
import '../../../../core/routes/assets_manager.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../widgets/body_auth_screens.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    return BodyAuthScreen(
      widget: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogoSection(),
            SizedBox(height: ScreenUtilNew.height(16)),
            _buildIntroText(context),
            SizedBox(height: ScreenUtilNew.height(16)),
            _buildLoginForm(context),
            SizedBox(height: ScreenUtilNew.height(8)),
            _buildForgotPasswordLink(context),
            SizedBox(height: ScreenUtilNew.height(24)),
            _buildLoginButton(context),
            _buildSignUpSection(context),
            SizedBox(height: ScreenUtilNew.height(16)),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        SizedBox(height: ScreenUtilNew.height(32)),
        AppLogo(
          height: ScreenUtilNew.height(145),
          width: ScreenUtilNew.width(123),
          imagePath: AssetsManager.logoEnglish,
        ),
      ],
    );
  }

  Widget _buildIntroText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.login_screen_text1,
            style: GoogleFonts.cairo(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary,
            ),
          ),
          Text(
            context.localizations.login_screen_text2,
            style: GoogleFonts.cairo(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Column(
      children: [
        ColumnTextField(
          iconData: Icons.email_outlined,
          controller: emailTextEditingController,
          title: context.localizations.login_screen_text3,
          hintText: context.localizations.login_screen_text4,
          passwordTextFields: false,
          validator: (value) => Validators.validateEmail(value, currentLocale.toString()), // Wrap validator with language argument
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        ColumnTextField(
          iconData: Icons.lock_outline_rounded,
          controller: passwordTextEditingController,
          title: context.localizations.login_screen_text5,
          hintText: context.localizations.login_screen_text6,
          passwordTextFields: true,
          validator: (value) => Validators.validatePassword(value, currentLocale.toString()), // Wrap validator with language argument
        ),
      ],
    );
  }

  Widget _buildForgotPasswordLink(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoutes.forgetPasswordScreen),
        child: Text(
          context.localizations.login_screen_text7,
          style: GoogleFonts.cairo(
            fontSize: 8.sp,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
            decorationColor: AppColors.secondary,
            color: AppColors.secondary,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, ScreenUtilNew.height(52)),
          backgroundColor: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: handleLogin,
        child: Text(
          context.localizations.login_screen_text8,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtilNew.height(140)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.localizations.login_screen_text9,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
              color: const Color(0XFF727272),
            ),
          ),
          SizedBox(width: ScreenUtilNew.width(2)),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.signUpScreen),
            child: Text(
              context.localizations.login_screen_text10,
              style: GoogleFonts.cairo(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
                decorationColor: AppColors.secondary,
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailTextEditingController.text.trim();
      final password = passwordTextEditingController.text.trim();
      print('Login with Email: $email, Password: $password');
      showCustomDialogSuccess(context);
    } else {
      showCustomDialogError(context);
      print('Please fill in all fields correctly.');
    }
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
