import 'package:electronicsshop_app/cores/app_exports.dart';




class CategoryAppBarList extends StatelessWidget {
  final Function(Category) onTap;
  const CategoryAppBarList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          Category category = categoriesList[index];
          bool isPhone = category.name == "SmartPhones";
          bool isFridge = category.name == "Fridge";
          bool isAc = category.name == "AC";
          bool isWatch = category.name == "SmartWatch";
          bool isHeadphone = category.name == "HeadPhone";
          bool isLaptop = category.name == "Laptop";
          bool isTv = category.name == "Television";
          return GestureDetector(
            onTap: (){
              onTap(category);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                    isPhone ? ImageConstants.smartphoneIcon :
                    isFridge ? ImageConstants.fridgeIcon :
                    isAc ? ImageConstants.airConIcon :
                    isWatch ? ImageConstants.smartwatchIcon :
                    isHeadphone ? ImageConstants.headphoneIcon :
                    isLaptop ? ImageConstants.laptopIcon :
                    isTv ? ImageConstants.tvIcon : ImageConstants.phoneImage
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class CategoryList extends StatelessWidget {
  final Function(Category) onTap;
  const CategoryList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          Category category = categoriesList[index];
          bool isPhone = category.name == "SmartPhones";
          bool isFridge = category.name == "Fridge";
          bool isAc = category.name == "AC";
          bool isWatch = category.name == "SmartWatch";
          bool isHeadphone = category.name == "HeadPhone";
          bool isLaptop = category.name == "Laptop";
          bool isTv = category.name == "Television";
          return GestureDetector(
            onTap: (){
             onTap(category);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 5),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                          isPhone ? ImageConstants.smartphoneIcon :
                          isFridge ? ImageConstants.fridgeIcon :
                          isAc ? ImageConstants.airConIcon :
                          isWatch ? ImageConstants.smartwatchIcon :
                          isHeadphone ? ImageConstants.headphoneIcon :
                          isLaptop ? ImageConstants.laptopIcon :
                          isTv ? ImageConstants.tvIcon : ImageConstants.phoneImage),


                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoriesList[index].name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final ElectronicProduct product;
  const ProductsGrid({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String abbreviatedProductBrand =
    product.brand.length > 7 ? '${product.brand.substring(0, 7)}...' : product.brand;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        // border: Border.all(
        //   color: Colors.pink[300]!, // Choose your border color
        //   width: 0.3, // Choose your border width
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
               children: [
                Image.asset(product.img),
                Positioned(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.favorite_border, color: Colors.pink,),
                        ))
                )
              ],
            ),
            const SizedBox(height: 3,),
            Row(
              children: [
                Text(abbreviatedProductBrand, style: const TextStyle(color: Colors.white),),
                const SizedBox(width: 3, ),
                const Icon(Icons.star, color: Colors.amber, size: 15,),
                const SizedBox(width: 3,),
                const Text("4.9", style: TextStyle(color: Colors.white),),
                const SizedBox(width: 3,),
                const Text("(250)", style: TextStyle(color: Colors.white),),
              ],
            ),
            const SizedBox(height: 3,),
            Text(product.description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox(height: 3,),
            Text("N${product.price}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
          ],
        ),
      ),
    );
  }
}

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numOfItemsInCart = ref.watch(cartNotifierProvider).length;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartScreen();
        }));
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 30),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                numOfItemsInCart.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


