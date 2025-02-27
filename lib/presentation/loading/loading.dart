import 'package:electronicsshop_app/cores/app_exports.dart';
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), // Adjust opacity as needed
                    BlendMode.darken, // Blend mode to darken the image
                  ),
                  image: AssetImage(ImageConstants.splashscreenImage)
              ) ,

            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.bolt, color: Colors.blue, size: 40,),
                      Text("Electro-Store", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(height: 30),
                  SpinKitRipple(
                    color: Colors.white,
                    size: 50.0,
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
