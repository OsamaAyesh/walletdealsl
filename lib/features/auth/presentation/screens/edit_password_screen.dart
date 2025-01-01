import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/core/routes/app_routes.dart';
import 'package:walletdeals/core/utils/context_extension.dart';
import 'package:walletdeals/core/validator/validator.dart';
import 'package:walletdeals/features/auth/presentation/widgets/build_back_button_circle.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/routes/assets_manager.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gradient_background.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  // Initialize TextEditingController for both fields
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Key for Form validation

  @override
  void dispose() {
    // Dispose controllers when screen is disposed
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // This function returns the text field widget with appropriate styling
  Widget buildTextField({
    required String title,
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return ColumnTextField(
      iconData: Icons.lock_outline_rounded,
      controller: controller,
      title: title,
      hintText: hintText,
      passwordTextFields: true,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true, // This will make sure the layout resizes to avoid keyboard overlap
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
                  height: ScreenUtilNew.height(736),
                  width: ScreenUtilNew.width(343),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,  // Wrapping with Form widget
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenUtilNew.height(16)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtilNew.width(16),
                            ),
                            child: const BuildBackButtonCircle(),
                          ),
                          SizedBox(height: ScreenUtilNew.height(8)),
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              AssetsManager.logoEnglish,
                              height: ScreenUtilNew.height(145),
                              width: ScreenUtilNew.width(123),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: ScreenUtilNew.height(16)),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtilNew.width(16),
                              ),
                              child: Text(
                                context.localizations.new_password_screen_text1,
                                style: GoogleFonts.cairo(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtilNew.height(8)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtilNew.width(40),
                            ),
                            child: Text(
                              context.localizations.new_password_screen_text2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtilNew.height(32)),
                          // Using the function to create text fields
                          buildTextField(
                            title: context.localizations.new_password_screen_text3,
                            hintText: context.localizations.new_password_screen_text4,
                            controller: passwordController,
                            validator:(value) => Validators.validatePassword(value, currentLocale.toString()),
                          ),
                          SizedBox(height: ScreenUtilNew.height(8)),
                          buildTextField(
                            title: context.localizations.new_password_screen_text5,
                            hintText: context.localizations.new_password_screen_text6,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return currentLocale.toString()=="en"?'Passwords do not match':"كلمة المرور غير متطابقة ";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: ScreenUtilNew.height(100)),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned button at the bottom of the container
            Positioned(
              bottom: ScreenUtilNew.height(32), // Distance from the bottom of the screen
              left: ScreenUtilNew.width(16),  // Left margin
              right: ScreenUtilNew.width(16),  // Right margin
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtilNew.width(16),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      double.infinity,
                      ScreenUtilNew.height(52),
                    ),
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () {
                    // Trigger the form validation
                    if (_formKey.currentState?.validate() ?? false) {
                      // If validation succeeds, perform the password update logic
                      print('Password Updated');
                      showCustomDialogSuccess(context);
                      // You can proceed with the logic to save or update the password
                    } else {
                      print('Validation failed');
                      showCustomDialogError(context);
                    }
                  },
                  child: Text(
                    context.localizations.new_password_screen_text7,
                    style: GoogleFonts.cairo(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
                    context.localizations.error_dialog_new_password_screen_text1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFC01A1A),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(4)),
                  Text(
                    context.localizations.error_dialog_new_password_screen_text2,
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
                      context.localizations.error_dialog_new_password_screen_text3,
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
                    context.localizations.success_dialog_new_password_screen_text1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFF39C67E),
                    ),
                  ),
                  SizedBox(height: ScreenUtilNew.height(4)),
                  Text(
                    context.localizations.success_dialog_new_password_screen_text2,
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
                      backgroundColor: const Color(0XFF39C67E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      minimumSize: Size(double.infinity, ScreenUtilNew.height(47)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.loginScreenRoute);
                    },
                    child: Text(
                      context.localizations.success_dialog_new_password_screen_text3,
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
}
