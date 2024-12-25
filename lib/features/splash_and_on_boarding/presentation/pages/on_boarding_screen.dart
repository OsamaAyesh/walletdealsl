import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walletdeals/core/routes/assets_manager.dart';
import 'package:walletdeals/core/utils/context_extension.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/utils/screen_util_new.dart';
import '../widgets/widget_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String textInButton = "";

  @override
  void initState() {
    super.initState();
    _setupPageControllerListener();
    _setInitialButtonText();
  }

  void _setupPageControllerListener() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void _setInitialButtonText() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        textInButton = context.localizations.on_boarding_screen_page1_text3;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildCircleImageWidget(),
          _buildPageViewScreens(),
        ],
      ),
    );
  }

  Widget _buildCircleImageWidget() {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        AssetsManager.circleInOnBoardingScreen,
        height: ScreenUtilNew.height(89),
        width: ScreenUtilNew.width(92),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildPageViewScreens() {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _buildPageViewChildren(),
          ),
        ),
        SizedBox(height: ScreenUtilNew.height(105)),
        _buildPageIndicator(),
        SizedBox(height: ScreenUtilNew.height(36)),
        _buildNextButton(),
        SizedBox(height: ScreenUtilNew.height(48)),
      ],
    );
  }

  void _onPageChanged(int value) {
    setState(() {
      _currentPage = value;
      textInButton = _getButtonText(value);
    });
  }

  List<Widget> _buildPageViewChildren() {
    return [
      WidgetPageView(
        imagePath: AssetsManager.onBoardingImage1,
        title: context.localizations.on_boarding_screen_page1_text1,
        subTitle: context.localizations.on_boarding_screen_page1_text2,
        heightImage: ScreenUtilNew.height(308),
        widthImage: ScreenUtilNew.width(312),
        fit: BoxFit.contain,
      ),
      WidgetPageView(
        imagePath: AssetsManager.onBoardingImage2,
        title: context.localizations.on_boarding_screen_page2_text1,
        subTitle: context.localizations.on_boarding_screen_page2_text2,
        heightImage: ScreenUtilNew.height(308),
        widthImage: ScreenUtilNew.width(312),
        fit: BoxFit.fill,
      ),
      WidgetPageView(
        imagePath: AssetsManager.onBoardingImage3,
        title: context.localizations.on_boarding_screen_page3_text1,
        subTitle: context.localizations.on_boarding_screen_page3_text2,
        heightImage: ScreenUtilNew.height(308),
        widthImage: ScreenUtilNew.width(312),
        fit: BoxFit.contain,
      ),
    ];
  }

  String _getButtonText(int page) {
    switch (page) {
      case 0:
        return context.localizations.on_boarding_screen_page1_text3;
      case 1:
        return context.localizations.on_boarding_screen_page2_text3;
      case 2:
        return context.localizations.on_boarding_screen_page3_text3;
      default:
        return "";
    }
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) => _buildIndicatorDot(index)),
    );
  }

  Widget _buildIndicatorDot(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(6)),
      child: Container(
        height: ScreenUtilNew.height(4),
        width: ScreenUtilNew.width(25),
        decoration: BoxDecoration(
          color: _currentPage == index
              ? AppColors.primary
              : const Color(0XFFC4D0D0),
          borderRadius: BorderRadius.circular(3.r),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtilNew.width(24)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, ScreenUtilNew.height(44)),
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
        onPressed: _onNextButtonPressed,
        child: Text(
          textInButton,
          style: GoogleFonts.cairo(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _onNextButtonPressed() {
    if (_currentPage != 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      print("navigator to login screen");
      // Navigator.pushReplacementNamed(context, Routes.loginScreen);
    }
  }
}
