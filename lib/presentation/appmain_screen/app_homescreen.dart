import 'package:electronicsshop_app/cores/app_exports.dart';
import 'package:electronicsshop_app/data/models.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              // for header parts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.bolt, color: Colors.black, size: 30,),
                  const Expanded(child: SizedBox()),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                    const Icon(Icons.shopping_bag_rounded, size: 30,),
                    Positioned(
                      right: -3, top: -5,
                      child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                       ),
                        child: const Center(
                          child: Text("3",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                   ],
                  )
                ],
              ),
              const SizedBox(height: 20,),
              // App Banner
              const AppBanner(),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shop By Category",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black45
                      ),
                    )
                  ],
                ),
              ),


              // FOR CATEGORYLIST
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categoriesList.length, (index) {
                    return InkWell(
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xffe7e8ea),
                              backgroundImage: AssetImage(
                                  categoriesList[index].image,
                              ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(categoriesList[index].name)
                       ],
                      ),
                    );

                  }),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products For You",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0,
                          color: Colors.black45
                      ),
                    )
                  ],
                ),
              ),


              /// FOR PRODUCTS ITEMS
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
