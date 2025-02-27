import 'package:electronicsshop_app/cores/app_exports.dart';

class Onboarding1 extends StatefulWidget {
  final Function switchScreen;
  const Onboarding1({super.key, required this.switchScreen});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20,),
            const Center(child: Text("Welcome to Electro-Store", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
            const SizedBox(height: 30,),
            const Center(child: BuildSample(icon: Icons.tv, title: "Wide Range Of Products", text: "Explore a vast selection of electronics from top brands.")),
            const SizedBox(height: 30,),
            const Center(child: BuildSample(icon: Icons.new_label_rounded, title: "Exclusive Offers", text: "Get access to exclusive deals and discounts.")),
            const SizedBox(height: 30,),
            const Center(child: BuildSample(icon: Icons.local_shipping, title: "Fast Delivery", text: "Receive your orders quickly with our fast delivery service.")),
            const SizedBox(height: 20,),


            GestureDetector(
              onTap: (){
                widget.switchScreen(1);
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: const Text("Next", style: TextStyle(color: Colors.white),),
              ),
            ),

          ],
        ),
      )
    );
  }
}


class BuildSample extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  const BuildSample({super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(height: 10,),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
            const SizedBox(height: 5,),
            Expanded(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14,),))
          ],
        ),
      ),
    );
  }
}