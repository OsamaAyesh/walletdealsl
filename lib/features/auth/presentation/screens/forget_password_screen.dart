import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/core/routes/app_routes.dart';
import 'package:walletdeals/core/utils/context_extension.dart';
import 'package:walletdeals/features/auth/presentation/widgets/build_back_button_circle.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/routes/assets_manager.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../../../../core/validator/validator.dart';
import '../widgets/body_auth_screens.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_background.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // Initialize the TextEditingController
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
        children: [
          const GradientBackground(),
          Center(
            child: BodyAuthScreen(
              widget: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtilNew.height(16)),
                    _buildBackButton(),
                    SizedBox(height: ScreenUtilNew.height(8)),
                    _buildLogo(),
                    SizedBox(height: ScreenUtilNew.height(24)),
                    _buildIntroText(context),
                    SizedBox(height: ScreenUtilNew.height(24)),
                    _buildEmailTextField(),
                    SizedBox(height: ScreenUtilNew.height(24)),
                    _buildSubmitButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),)
    );
  }

  // Back Button Section
  Widget _buildBackButton() {
    return BuildBackButtonCircle();
  }

  // Logo Section
  Align _buildLogo() {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        AssetsManager.logoEnglish,
        height: ScreenUtilNew.height(145),
        width: ScreenUtilNew.width(123),
        fit: BoxFit.contain,
      ),
    );
  }

  // Intro Text Section
  Widget _buildIntroText(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            context.localizations.forget_password_text1,
            style: GoogleFonts.cairo(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(height: ScreenUtilNew.height(16)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Text(
            context.localizations.forget_password_text2,
            style: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // Email Text Field Section
  Widget _buildEmailTextField() {
    return ColumnTextField(
      iconData: Icons.email_outlined,
      controller: emailController,
      title: context.localizations.login_screen_text3,
      hintText: context.localizations.login_screen_text4,
      passwordTextFields: false,
      validator: (value) => Validators.validateEmail(value, 'en'), // Wrap validator with language argument
    );
  }

  // Submit Button Section
  Padding _buildSubmitButton(BuildContext context) {
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
          context.localizations.forget_password_text5,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      print('Email Validate: $email,');
      Navigator.pushNamed(context, AppRoutes.otpCodeScreen);
    } else {
      print('Please fill in all fields correctly.');
    }
  }
}
