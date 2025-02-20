import 'package:electronicsshop_app/presentation/auth/electronicsshoplogin.dart';
import 'package:electronicsshop_app/presentation/onboarding/electronicsapp_onboardingone.dart';
import 'package:electronicsshop_app/presentation/auth/electronicsappsignup.dart';
import 'package:electronicsshop_app/presentation/onboarding/electronicsapp_onboardingtwo.dart';
import 'package:electronicsshop_app/presentation/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/': (context) => const ElectronicsappOnboardingtwo()
        // '/': (context) => const SplashScreen(),
        // '/intro': (context) => const ElectronicsappIntro(),
        // '/signup': (context) => const ElectronicsAppSignup(),
        // '/login': (context) => const ElectronicsShopLogin(),
      },
    );
  }
}
