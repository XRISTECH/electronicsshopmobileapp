import 'package:electronicsshop_app/cores/app_exports.dart';

class Explore extends StatefulWidget {
  const Explore({super.key, required this.onSwitch});

  final Function onSwitch;

  @override
  State<Explore> createState() => _SearchState();
}

class _SearchState extends State<Explore> {
  Category productCategory = categoriesList[0];
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
          Row(
            children: [
              const Icon(Icons.arrow_back_ios, color: Colors.white,),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: 250,
                height: 50,
                child: TextFormField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: textInputDecoration.copyWith(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Gadgets',
                    enabledBorder: inputBorder,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              const CartIcon()
            ],
          ),
            const SizedBox(height: 20,),
          const FilterWays(),
            const SizedBox(height: 10,),
            CategoryList(onTap:(category){
              setState(() {
                productCategory = category;
              });
            }),
        Expanded(
          child: GridView.builder(
              itemCount: getLength(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (context, index){
                ElectronicProduct product = getProduct(index);
                return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AppItemsDetails(product: product,)));
                    },
                    child: ProductsGrid(product: product,)
                );
              }),
        )
          ],
        ),
      )
    );
  }

  ElectronicProduct getProduct(int index){
    switch (productCategory.name) {
      case "SmartPhones":
        return smartphones[index];
      case "Fridge":
        return fridges[index];
      case "AC":
        return airConditioners[index];
      case "SmartWatch":
        return smartwatches[index];
      case "HeadPhone":
        return headphones[index];
      case "Laptop":
        return laptops[index];
      case "Television":
      default:
        return televisions[index];
    }

  }

  int getLength(){
    switch (productCategory.name) {
      case "SmartPhones":
        return smartphones.length;
      case "Fridge":
        return fridges.length;
      case "AC":
        return airConditioners.length;
      case "SmartWatch":
        return smartwatches.length;
      case "HeadPhone":
        return headphones.length;
      case "Laptop":
        return laptops.length;
      case "Television":
      default:
        return televisions.length;
    }
  }
}
