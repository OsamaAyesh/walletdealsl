import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/core/utils/context_extension.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/routes/assets_manager.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../../../../core/validator/validator.dart';
import '../widgets/build_back_button_circle.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/drop_down_menu_country_list.dart';
import '../widgets/gradient_background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for text fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // State for the radio button
  bool agreeToTerms = false;

  // Function to validate all inputs
  bool validateInputs(BuildContext context) {
    final Locale currentLocale = Localizations.localeOf(context);
    return [
      Validators.validateTextField(firstNameController.text, currentLocale.toString()) == null,
      Validators.validateTextField(lastNameController.text, currentLocale.toString()) == null,
      Validators.validateEmail(emailController.text, currentLocale.toString()) == null,
      Validators.validatePhoneNumber(phoneController.text, currentLocale.toString()) == null,
      Validators.validateTextField(cityController.text, currentLocale.toString()) == null,
      Validators.validatePassword(passwordController.text, currentLocale.toString()) == null,
      agreeToTerms,
    ].every((result) => result == true);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Locale currentLocale = Localizations.localeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenUtilNew.height(16)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: BuildBackButtonCircle(),
                      ),
                      _buildLogo(),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildSignupTexts(context),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildFormFields(context, currentLocale),
                      SizedBox(height: ScreenUtilNew.height(24)),
                      _buildSignupButton(context),
                      SizedBox(height: ScreenUtilNew.height(16)),
                      _buildFooter(context),
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

  Widget _buildLogo() {
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

  Widget _buildSignupTexts(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.sign_up_screen_text1,
            style: GoogleFonts.cairo(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary,
            ),
          ),
          Text(
            context.localizations.sign_up_screen_text2,
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

  Widget _buildFormFields(BuildContext context, Locale currentLocale) {
    return Column(
      children: [
        ColumnTextField(
          iconData: Icons.person,
          controller: firstNameController,
          title: context.localizations.sign_up_screen_text3,
          hintText: context.localizations.sign_up_screen_text4,
          passwordTextFields: false,
          validator: (value) => Validators.validateTextField(value, currentLocale.toString()),
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        ColumnTextField(
          iconData: Icons.person,
          controller: lastNameController,
          title: context.localizations.sign_up_screen_text5,
          hintText: context.localizations.sign_up_screen_text6,
          passwordTextFields: false,
          validator: (value) => Validators.validateTextField(value, currentLocale.toString()),
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        ColumnTextField(
          iconData: Icons.email_outlined,
          controller: emailController,
          title: context.localizations.sign_up_screen_text7,
          hintText: context.localizations.sign_up_screen_text8,
          passwordTextFields: false,
          validator: (value) => Validators.validateEmail(value, currentLocale.toString()),
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        ColumnTextField(
          iconData: Icons.phone_android,
          controller: phoneController,
          title: context.localizations.sign_up_screen_text9,
          hintText: context.localizations.sign_up_screen_text10,
          passwordTextFields: false,
          validator: (value) => Validators.validatePhoneNumber(value, currentLocale.toString()),
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        DropDownWidgetTextFieldGetCountry(
          textTitle: context.localizations.sign_up_screen_text11,
          options: ["اختر المنطقة...", "رام الله", "نابلس", "جنين"],
          onChanged: (String? value) {},
          selectedValueString: 'اختر المنطقة...',
          selectDefaultValue: 0,
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        ColumnTextField(
          iconData: Icons.lock_outlined,
          controller: passwordController,
          title: context.localizations.sign_up_screen_text13,
          hintText: context.localizations.sign_up_screen_text14,
          passwordTextFields: true,
          validator: (value) => Validators.validatePassword(value, currentLocale.toString()),
        ),
        Row(
          children: [
            Checkbox(
              value: agreeToTerms,
              onChanged: (value) {
                setState(() {
                  agreeToTerms = value ?? false;
                });
              },
              activeColor: Colors.blue,
            ),
            Text(
              context.localizations.sign_up_screen_text15,
              style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignupButton(BuildContext context) {
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
        onPressed: () {
          if (validateInputs(context)) {
            print("Signup successful!");
          } else {
            print("Please fill all fields correctly.");
          }
        },
        child: Text(
          context.localizations.sign_up_screen_text16,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.localizations.sign_up_screen_text17,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
            color: const Color(0XFF727272),
          ),
        ),
        SizedBox(width: ScreenUtilNew.width(2)),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            context.localizations.sign_up_screen_text18,
            style: GoogleFonts.cairo(
              decoration: TextDecoration.underline,
              decorationColor: AppColors.secondary,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
