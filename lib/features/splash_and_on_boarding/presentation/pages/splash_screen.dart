import 'dart:async';
import 'package:flutter/material.dart';
import 'package:walletdeals/config/theme/colors.dart';
import 'package:walletdeals/core/routes/assets_manager.dart';
import 'package:walletdeals/core/utils/screen_util_new.dart';
import '../../../../config/network/network_info.dart';
import '../../../../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  final NetworkInfo _networkInfo = NetworkInfo();
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _initializeScreen();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,  // Elastic curve for bouncing effect
    );
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> _initializeScreen() async {
    bool isConnected = await _networkInfo.isConnected();
    await Future.delayed(const Duration(seconds: 3));  // Wait a bit before checking
    if (isConnected) {
      _navigateToNextScreen();
    } else {
      _navigateToErrorInterNetScreen();
    }
  }


  void _navigateToNextScreen() {
    Navigator.pushReplacementNamed(context, AppRoutes.onBoardingRoute);
  }
  void _navigateToErrorInterNetScreen() {
    Navigator.pushReplacementNamed(context, AppRoutes.errorInternetConnection);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the screen size utility
    ScreenUtilNew.init(context);

    return Scaffold(
      body: SafeArea( // Ensuring content stays within screen boundaries
        child: Stack(
          children: [
            _buildLogoImageInApplication(),
            _circleProgressIndicator(),
          ],
        ),
      ),
    );
  }

  // Logo image positioned at the center with ScaleTransition effect
  Widget _buildLogoImageInApplication() {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Image.asset(
          AssetsManager.logoArabic,
          height: ScreenUtilNew.height(243),
          width: ScreenUtilNew.width(168),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  // Animated Circular Progress Indicator with rotation and scaling effect
  Widget _circleProgressIndicator() {
    return Positioned(
      bottom: ScreenUtilNew.height(70),
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return const CircularProgressIndicator(
              color: AppColors.primary,
            );
          },
        ),
      ),
    );
  }
}
