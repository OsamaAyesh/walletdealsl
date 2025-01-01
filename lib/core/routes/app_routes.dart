import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/left_to_right_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:walletdeals/core/errors/screens/error_internet.dart';
import 'package:walletdeals/features/auth/presentation/screens/edit_password_screen.dart';
import 'package:walletdeals/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:walletdeals/features/auth/presentation/screens/login_screen.dart';
import 'package:walletdeals/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:walletdeals/features/splash_and_on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:walletdeals/features/splash_and_on_boarding/presentation/pages/splash_screen.dart';

import '../../features/auth/presentation/screens/otp_code_screen.dart';

/// Manages app routes and transitions
class AppRoutes {
  // Splash and Onboarding features
  static const String initialRoute = '/splash_screen';
  static const String onBoardingRoute = '/on_boarding_screen';

  // Authentication features
  static const String loginScreenRoute = "/login_screen";
  static const String forgetPasswordScreen="/forget_password_screen";
  static const String otpCodeScreen="/otp_code_screen";
  static const String editPasswordScreen="/edit_password_screen";
  static const String signUpScreen="/sign_up_screen";

  // Core - Errors
  static const String errorInternetConnection = "/error_internet";

  /// Generates routes dynamically based on the provided [RouteSettings]
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _buildPageTransition(
          const SplashScreen(),
          LeftToRightFadedTransition(),
        );
      case onBoardingRoute:
        return _buildPageTransition(
          const OnBoardingScreen(),
          LeftToRightFadedTransition(),
        );
      case errorInternetConnection:
        return _buildPageTransition(
          const ErrorInternet(),
          LeftToRightFadedTransition(),
        );
      case loginScreenRoute:
        return _buildPageTransition(
          const LoginScreen(), // Temporary placeholder
          LeftToRightFadedTransition(),
        );
      case forgetPasswordScreen:
        return _buildPageTransition(
           ForgetPasswordScreen(), // Temporary placeholder
          LeftToRightFadedTransition(),
        );
      case otpCodeScreen:
        return _buildPageTransition(
          const OTPScreen(), // Temporary placeholder
          LeftToRightFadedTransition(),
        );
      case editPasswordScreen:
        return _buildPageTransition(
          const EditPasswordScreen(), // Temporary placeholder
          LeftToRightFadedTransition(),
        );
      case signUpScreen:
        return _buildPageTransition(
          const SignupScreen(), // Temporary placeholder
          LeftToRightFadedTransition(),
        );
      default:
      // Default route for undefined paths
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }

  /// Builds a page transition with a given [page] and [animation]
  static PageAnimationTransition _buildPageTransition(
      Widget page,
      dynamic animation,
      ) {
    return PageAnimationTransition(
      page: page,
      pageAnimationType: animation,
    );
  }
}
