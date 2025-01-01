import 'package:flutter/material.dart';

import '../utils/screen_util_new.dart';

class AppLogo extends StatelessWidget {
  const AppLogo(
      {super.key,
      required this.height,
      required this.width,
      required this.imagePath});
  final double height;
  final double width;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        imagePath,
        height: ScreenUtilNew.height(height),
        width: ScreenUtilNew.width(width),
        fit: BoxFit.contain,
      ),
    );
  }
}
