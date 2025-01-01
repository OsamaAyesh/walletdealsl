import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/utils/screen_util_new.dart';


class DropDownWidgetTextFieldGetCountry extends StatefulWidget {
  final int selectDefaultValue;
  final String textTitle;
  final List<String> options; // قائمة الخيارات من نوع DataSources
  final ValueChanged<String?>
  onChanged; // استدعاء دالة callback مع DataSources
  final String selectedValueString;

  const DropDownWidgetTextFieldGetCountry(
      {super.key, required this.textTitle, required this.options, required this.onChanged, required this.selectedValueString,required this.selectDefaultValue});

  @override
  State<DropDownWidgetTextFieldGetCountry> createState() =>
      _DropDownWidgetTextFieldState();
}

class _DropDownWidgetTextFieldState extends State<DropDownWidgetTextFieldGetCountry> {
  String? selectedAccount;

  @override
  void initState() {
    super.initState();
    // تعيين القيمة الابتدائية بناءً على القيمة المحددة
    selectedAccount = widget.options[0];
        // widget.options.firstWhere(
        //     (option) => option.id == widget.selectDefaultValue,
        // orElse: () => widget.options[0]); // أو أول خيار كمثال

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Row(
            children: [
              const Icon(
                Icons.home_work_outlined,
                color: AppColors.secondary,
              ),
              SizedBox(
                width: ScreenUtilNew.width(8),
              ),
              Text(
                widget.textTitle,
                style: GoogleFonts.cairo(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: ScreenUtilNew.height(8)),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Container(
            height: ScreenUtilNew.height(52),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.04),
              borderRadius: BorderRadius.circular(12.r),            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedAccount,
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: AppColors.primary, size: 24),
                dropdownColor: Colors.white,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedAccount = newValue;
                      widget.onChanged(newValue);
                    });
                  }
                },
                items: widget.options.map((String item) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.centerRight,
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}