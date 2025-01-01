import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/utils/screen_util_new.dart';

class ColumnTextField extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool passwordTextFields;
  final String? Function(String?)? validator; // Validator as a parameter

  const ColumnTextField({
    super.key,
    required this.iconData,
    required this.title,
    required this.controller,
    required this.hintText,
    required this.passwordTextFields,
    this.validator, // Adding validator parameter
  });

  @override
  _ColumnTextFieldState createState() => _ColumnTextFieldState();
}

class _ColumnTextFieldState extends State<ColumnTextField> {
  bool _obscureText = true; // Default to true for password fields

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Row(
            children: [
              Icon(
                widget.iconData,
                color: AppColors.secondary,
              ),
              SizedBox(
                width: ScreenUtilNew.width(8),
              ),
              Text(
                widget.title,
                style: GoogleFonts.cairo(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtilNew.height(8),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.passwordTextFields ? _obscureText : false,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: AppColors.primary,
            ),
            obscuringCharacter: "*",
            decoration: InputDecoration(
              filled: true,
              suffixIcon: widget.passwordTextFields
                  ? IconButton(
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: AppColors.secondary,
                ),
              )
                  : null,
              fillColor: AppColors.primary.withOpacity(0.04),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.cairo(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.primary,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            validator: widget.validator, // Applying the validator here
          ),
        ),
      ],
    );
  }

  // Function to toggle password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the password visibility
    });
  }
}
