import 'package:electronicsshop_app/cores/app_exports.dart';


class AppBanner extends StatelessWidget {
  const AppBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.8), // Adjust opacity as needed
              BlendMode.darken, // Blend mode to darken the image
            ),
            image: AssetImage(ImageConstants.laptopDisplay,

            )
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("NEW COLLECTION", style: TextStyle(color: Colors.white),),
              const SizedBox(height: 5,),
              const Row(
                children: [
                  Text("20", style: TextStyle(fontSize: 30, color: Colors.white), ),
                   Column(
                     children: [
                       Text("%", style: TextStyle(fontSize: 13,  color: Colors.white),),
                       Text("off", style: TextStyle(fontSize: 10,  color: Colors.white),),
                     ],
                   )
                ],
              ),
              const SizedBox(height: 5,),
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
              child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
          const Expanded(child: SizedBox(),),
          Image.asset(ImageConstants.tvImg, height: 100)
        ],
        ),
      )

    );
  }
}


