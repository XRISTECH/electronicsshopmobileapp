import 'package:electronicsshop_app/cores/app_exports.dart';


class AppBanner extends StatelessWidget {
  const AppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffc4d1da),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("NEW COLLECTION"),
              const Row(
                children: [
                  Text("20", style: TextStyle(fontSize: 30),),
                   Column(
                     children: [
                       Text("%", style: TextStyle(fontSize: 10),),
                       Text("off", style: TextStyle(fontSize: 10),),
                     ],
                   )
                ],
              ),
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const Text("SHOP NOW", style: TextStyle(color: Colors.white),),
              )
            ],
          ),
          const Expanded(child: SizedBox(),),
          Image.asset(ImageConstants.appbannerImage, height: 100)
        ],
        ),
      )

    );
  }
}


