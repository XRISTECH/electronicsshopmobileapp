import 'package:electronicsshop_app/cores/app_exports.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String onboardingScreen1 = '/onboarding';
  static const String onboardingScreen2= '/onboarding2';
  static const String loginScreen = '/login';
  static const String signup = '/signup';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context) => const SplashScreen(),
    onboardingScreen1: (context) => const ElectronicsappOnboardingone(),
    onboardingScreen2: (context) => const ElectronicsappOnboardingtwo(),
    loginScreen: (context) => const ElectronicsShopLogin(),
    signup: (context) => const ElectronicsAppSignup()

  };
}