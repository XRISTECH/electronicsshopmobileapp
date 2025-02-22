import 'package:electronicsshop_app/cores/app_exports.dart';




class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _switchScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
      Onboarding1(switchScreen: _switchScreen),
      Onboarding2(switchScreen: _switchScreen),
        ],
      ),
    );
  }
}
