import 'package:electronicsshop_app/cores/app_exports.dart';


class AppItemsDetails extends ConsumerStatefulWidget {
  final ElectronicProduct product;
  const AppItemsDetails({super.key, required this.product});

  @override
  ConsumerState<AppItemsDetails> createState() => _AppItemsDetailsState();
}

class _AppItemsDetailsState extends ConsumerState<AppItemsDetails> {
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
    final cartProducts = ref.watch(cartNotifierProvider);
    bool isProductInCart = cartProducts.contains(widget.product);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Product Details",
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CartIcon(),
          )
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
                GestureDetector(
                  onTap: isProductInCart ? removeFromCart : addToCart,
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.shopping_cart, color: Colors.white,),
                        const SizedBox(width: 3,),
                        Text(isProductInCart ? "REMOVE" : "ADD TO CART",style:  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),)
                      ],
                    ),
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
  void addToCart(){
    ref.read(cartNotifierProvider.notifier).addProduct(widget.product);
  }
  void removeFromCart(){
    ref.read(cartNotifierProvider.notifier).removeProduct(widget.product);
  }


}







