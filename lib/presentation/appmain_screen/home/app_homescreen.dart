import 'package:electronicsshop_app/cores/app_exports.dart';

class AppHomeScreen extends ConsumerStatefulWidget {
  final Function onSwitch;
  const AppHomeScreen({super.key, required this.onSwitch});

  @override
  ConsumerState<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends ConsumerState<AppHomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  Category productCategory = categoriesList[0];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= 400.0) {
      if (!_isScrollingDown) {
        print(_isScrollingDown);
        setState(() {
          _isScrollingDown= true;
        });
      }
    } else {
      if (_isScrollingDown) {
        print(_isScrollingDown);
        setState(() {
      _isScrollingDown = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final productState = ref.watch(productControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
          body: CustomScrollView(
          controller: _scrollController,
          slivers: [
          _isScrollingDown ? SliverAppBar(
          backgroundColor: Colors.black,
          pinned: true,
          floating: true,
          automaticallyImplyLeading: false,
          title: Builder(builder: (context){
          return  CategoryAppBarList(onTap: (category) {
            setState(() {
              productCategory = category;
            });
          },);
          })
          ) : SliverPadding(
          padding: const EdgeInsets.only(top: 5.0),
          sliver: SliverList(delegate: SliverChildListDelegate([
          Container()
          ])),
          ),

          SliverPadding(
          padding: const EdgeInsets.all(30.0),
          sliver: SliverList(
          delegate: SliverChildListDelegate(
          [
            // Header
          Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          const Icon(Icons.bolt, color: Colors.pink, size: 30),
          Text("Hi ${user!.username} !", style: const TextStyle(color: Colors.white, fontSize: 16),),
          const Expanded(child: SizedBox()),
          const CartIcon()
          ],
          ),
          ),
            const SizedBox(height: 20),
             AppBanner(onTap: () {
              widget.onSwitch(1);
            },),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shop By Category",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            // Category List
            CategoryList(onTap: (category) {
              setState(() {
                productCategory = category;
              });
            },),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products For You",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
              ],
            ),

          ],
          ),
          ),
          ),
          // Products Grid
          SliverPadding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
          sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
              (context, index) {
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
          },
          childCount: getLength(),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
          ),
          ),
          ),
          ],
          ),
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

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

}
