import 'package:electronicsshop_app/cores/app_exports.dart';

class ElectronicsappOnboardingtwo extends StatefulWidget {
  const ElectronicsappOnboardingtwo({super.key});

  @override
  State<ElectronicsappOnboardingtwo> createState() => _ElectronicsappOnboardingtwoState();
}

class _ElectronicsappOnboardingtwoState extends State<ElectronicsappOnboardingtwo> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Align items to the top
                children: <Widget>[
                  const SizedBox(height: 20), // Moves the text up
                  const Text(
                    'W-ELECTRICALS',
                    style: TextStyle(
                      color: Color(0xFF1D3767),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5), // Adjust spacing between texts
                  const Text(
                    'Welcome to W-Electricals, Let’s Shop!',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: screenHeight * 0.45, // Adjust image height
                    child: Image.asset(
                      'images/3949019-removebg-preview.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adds space above the button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0), // Moves button up
                  child: Text(
                    'skip',
                    style: TextStyle(fontSize: 20, color: Color(0xFF1D3767), fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0), // Moves button up
                  child: ElevatedButton(
                    onPressed: () {
                      NavigatorService.popAndPushNamed(AppRoutes.auth);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(fontSize: 18),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF1D3767),
                    ),
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
