import 'package:angel_fetus/presentation/home_page.dart';
import 'package:angel_fetus/presentation/init_page.dart';
import 'package:angel_fetus/presentation/on_boarding_page.dart';
import 'package:angel_fetus/presentation/registry.dart';
import 'package:angel_fetus/presentation/splash_screen.dart';
import 'package:angel_fetus/presentation/trackingtools/tracking_tools.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String onBoardingPage = '/on_boarding_page';

  static const String registry = '/registry';

  static const String initPage = '/init_page';

  static const String homePage = '/home_page';

  static const String trackingTools = '/tracking_tools';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (context) => const SplashScreen(),
        onBoardingPage: (context) => const OnboardingPage(),
        registry: (context) => const Registry(),
        initPage: (context) => const InitPage(),
        homePage: (context) => HomePage(
            dueDate: ModalRoute.of(context)?.settings.arguments as DateTime),
        trackingTools: (context) => const TrackingTools(),
        initialRoute: (context) => const OnboardingPage(),
      };
}
