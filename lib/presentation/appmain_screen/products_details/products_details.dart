import 'package:electronicsshop_app/cores/app_exports.dart';
import 'package:electronicsshop_app/presentation/appmain_screen/products_details/shared/product_details_shared.dart';

class AppItemsDetails extends StatefulWidget {
  final ElectronicProduct product;
  const AppItemsDetails({super.key, required this.product});

  @override
  State<AppItemsDetails> createState() => _AppItemsDetailsState();
}

class _AppItemsDetailsState extends State<AppItemsDetails> {
  int currentIndex = 0;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;


  final List<Color> availableColors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple];
  void switchPage(int index){
    setState(() {
      currentIndex = index;
    });
  }

  void setColorIndex(int index){
    setState(() {
      selectedColorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Details Product",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
           Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(
                  Icons.shopping_bag_rounded,
                  size: 28,
                  color: Colors.white,
                ),
                Positioned(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        "3",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                  ProductImages(switchPage: switchPage, img: widget.product.img),
                  BuildCircle(currentIndex: currentIndex,),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Text(widget.product.brand, style: const TextStyle(color: Colors.white),),
                      const SizedBox(width: 3, ),
                      const Icon(Icons.star, color: Colors.amber, size: 15,),
                      const SizedBox(width: 3,),
                      const Text("4.9", style: TextStyle(color: Colors.white),),
                      const SizedBox(width: 3,),
                      const Text("(250)", style: TextStyle(color: Colors.white),),
                      const Expanded(child: SizedBox()),
                      const Icon(Icons.favorite_border, color: Colors.pink,),
                    ],
                  ),
            const SizedBox(height: 20,),
            Text(widget.product.description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox(height: 20,),
            const Text("Colors", style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox(height: 10,),
            ProductColors(availableColors: availableColors, setColorIndex: setColorIndex, selectedColorIndex: selectedColorIndex),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white,),
                      const SizedBox(width: 3,),
                      Text("ADD TO CART",style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),)
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    border: Border.all(color: Colors.pink),
                  ),
                  child: const Text("BUY NOW", style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ],
            )
          ],
        ),
      )



    );
  }
}







