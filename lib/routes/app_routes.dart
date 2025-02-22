import 'package:electronicsshop_app/cores/app_exports.dart';


class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String auth = '/auth';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    initialRoute: (context) => const Splash(),
    onboarding: (context) => const Onboarding(),
    auth: (context) => const Authenticate()

  };
}