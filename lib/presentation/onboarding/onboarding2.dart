import 'package:electronicsshop_app/cores/app_exports.dart';

class Onboarding2 extends StatefulWidget {
  final Function switchScreen;
  const Onboarding2({super.key, required this.switchScreen});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "Welcome to Electro-Store",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: 30,
              ),
              BuildSections(
                  image: ImageConstants.phoneImage,
                  title: "Smartphone X",
                  text:
                      "Experience the latest technology in your hand with cutting-edge features and design"),
              const SizedBox(
                height: 30,
              ),
              BuildSections(
                  image: ImageConstants.headphoneImg,
                  title: "Wireless Headphones",
                  text:
                      "Immerse yourself in music with noise-cancellation and superior sound quality"),
              const SizedBox(
                height: 30,
              ),
              BuildSections(
                  image: ImageConstants.smartwatchImage,
                  title: "Smartwatch Pro",
                  text:
                      "Stay connected and track your health with this efficient and stylish smartwatch"),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 500,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    onPressed: () {
                      NavigatorService.pushNamed(AppRoutes.auth);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}

class BuildSections extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const BuildSections({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(16.0), // Adjust the radius as needed
              child: Image.asset(
                image,
                height: 80,
                fit: BoxFit
                    .cover, // Ensures the image covers the given space properly
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
