import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/screen_util_new.dart';
import 'gradient_background.dart';

class BodyAuthScreen extends StatelessWidget {
  const BodyAuthScreen({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const GradientBackground(),
        Padding(
          padding: EdgeInsets.only(top: ScreenUtilNew.height(48),bottom: ScreenUtilNew.height(16)),
          child: Center(
            child: Container(
              height: ScreenUtilNew.height(736),
              width: ScreenUtilNew.width(343),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: widget,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
