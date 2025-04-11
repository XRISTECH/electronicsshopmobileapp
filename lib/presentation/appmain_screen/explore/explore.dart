import 'package:electronicsshop_app/cores/app_exports.dart';

class Explore extends ConsumerStatefulWidget {
  const Explore({super.key, required this.onSwitch});

  final Function onSwitch;

  @override
  ConsumerState<Explore> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Explore> {
  Category productCategory = categoriesList[0];
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productControllerProvider);
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
                if (productState.isLoading) {
                  return Center(child: Image.asset(ImageConstants.loader, width: 100, height: 100));
                }
                final product = getProduct(index);
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

  ProductModel getProduct(int index){
    final productState = ref.watch(productControllerProvider.notifier);
    switch (productCategory.name) {
      case "SmartPhones":
        return productState.smartPhones[index];
      case "Fridge":
        return productState.fridges[index];
      case "AC":
        return productState.airConditioners[index];
      case "SmartWatch":
        return productState.smartwatches[index];
      case "HeadPhone":
        return productState.headphones[index];
      case "Laptop":
        return productState.laptops[index];
      case "Television":
      default:
        return productState.televisions[index];
    }

  }

  int getLength(){
    final productState = ref.watch(productControllerProvider.notifier);
    switch (productCategory.name) {
      case "SmartPhones":
        return  productState.smartPhones.length;
      case "Fridge":
        return productState.fridges.length;
      case "AC":
        return productState.airConditioners.length;
      case "SmartWatch":
        return productState.smartwatches.length;
      case "HeadPhone":
        return productState.headphones.length;
      case "Laptop":
        return productState.laptops.length;
      case "Television":
      default:
        return productState.televisions.length;
    }
  }
}
