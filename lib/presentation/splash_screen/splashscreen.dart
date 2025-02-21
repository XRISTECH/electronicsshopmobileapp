import 'package:electronicsshop_app/cores/app_exports.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 20), () {
    NavigatorService.popAndPushNamed(AppRoutes.onboardingScreen1);
    },);
        super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              "images/electronics-computer-thumbnail-removebg-preview.png", // Your background image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),

          /// Color Overlay (Semi-transparent)
          Positioned.fill(
            child: Container(
              color: const Color(0xFF1D3767).withOpacity(0.95), // Adjust opacity
            ),
          ),

          /// Foreground Content (Logo and Text)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/welectricalslogo.png",
                  height: 450,
                ),
                const SizedBox(height: 5),
                const Text(
                  'ONLINE ELECTRONIC SHOP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
