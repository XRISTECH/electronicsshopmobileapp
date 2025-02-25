import 'package:electronicsshop_app/cores/app_exports.dart';


class CategoryAppBarList extends StatelessWidget {
  const CategoryAppBarList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          bool isPhone = categoriesList[index].name == "SmartPhones";
          bool isFridge = categoriesList[index].name == "Fridge";
          bool isAc = categoriesList[index].name == "AC";
          bool isWatch = categoriesList[index].name == "SmartWatch";
          bool isHeadphone = categoriesList[index].name == "HeadPhone";
          bool isLaptop = categoriesList[index].name == "Laptop";
          bool isTv = categoriesList[index].name == "Television";
          return InkWell(
            onTap: (){

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
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          bool isPhone = categoriesList[index].name == "SmartPhones";
          bool isFridge = categoriesList[index].name == "Fridge";
          bool isAc = categoriesList[index].name == "AC";
          bool isWatch = categoriesList[index].name == "SmartWatch";
          bool isHeadphone = categoriesList[index].name == "HeadPhone";
          bool isLaptop = categoriesList[index].name == "Laptop";
          bool isTv = categoriesList[index].name == "Television";
          return InkWell(
            onTap: (){},
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
  final int index;
  const ProductsGrid({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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
                Image.asset(smartphones[index].img),
                Positioned(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.favorite_border, color: Colors.black,),
                        ))
                )
              ],
            ),
            const SizedBox(height: 3,),
            Row(
              children: [
                Text(smartphones[index].brand, style: TextStyle(color: Colors.white),),
                const SizedBox(width: 3, ),
                const Icon(Icons.star, color: Colors.amber, size: 15,),
                const SizedBox(width: 3,),
                const Text("4.9", style: TextStyle(color: Colors.white),),
                const SizedBox(width: 3,),
                const Text("(250)", style: TextStyle(color: Colors.white),),
              ],
            ),
            const SizedBox(height: 3,),
            Text(smartphones[index].description, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
            const SizedBox(height: 3,),
            Text("N${smartphones[index].price}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
