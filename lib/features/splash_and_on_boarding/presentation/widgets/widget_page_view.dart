import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/screen_util_new.dart';
class WidgetPageView extends StatelessWidget {
  String imagePath;
  String title;
  String subTitle;
  double heightImage;
  double widthImage;
  BoxFit? fit;
  WidgetPageView({super.key,required this.imagePath,required this.title,required this.subTitle,required this.heightImage,required this.widthImage,required this.fit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenUtilNew.height(115),),
        Image.asset(
          imagePath,
          height: heightImage,
          width: widthImage,
          fit: fit,
        ),
        SizedBox(height: ScreenUtilNew.height(16),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Text(
            title,
            style: GoogleFonts.cairo(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
        SizedBox(height: ScreenUtilNew.height(8),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(16)),
          child: Text(
            subTitle,
            style: GoogleFonts.cairo(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),

      ],
    );
  }
}