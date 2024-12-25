import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:walletdeals/core/errors/screens/error_internet.dart';
import 'package:walletdeals/features/splash_and_on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:walletdeals/features/splash_and_on_boarding/presentation/pages/splash_screen.dart';

class AppRoutes {
  // features - splash_and_on_boarding
  static const String initialRoute = '/splash_screen';
  static const String onBoardingRoute = '/on_boarding_screen';


  //core-errors
  static const String errorInternetConnection="/error_internet";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return PageAnimationTransition(
          page: const SplashScreen(),
          pageAnimationType: BottomToTopTransition(), // انتقال من أسفل إلى أعلى
        );
      case onBoardingRoute:
        return PageAnimationTransition(
          page: const OnBoardingScreen(),
          pageAnimationType: BottomToTopTransition(), // انتقال من أسفل إلى أعلى
        );
      case errorInternetConnection:
        return PageAnimationTransition(
          page: const ErrorInternet(),
          pageAnimationType: BottomToTopTransition(), // انتقال من أسفل إلى أعلى
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
