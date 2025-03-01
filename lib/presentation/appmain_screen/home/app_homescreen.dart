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

  void signOut() {
    ref.read(authRepositoryProvider).signOut(ref);
  }

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
    final user = ref.read(userProvider);

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
          GestureDetector(
            onTap: (){
              signOut();
            },
              child: const Icon(Icons.bolt, color: Colors.pink, size: 30)),
          Text("Welcome ${user!.username} !", style: const TextStyle(color: Colors.white, fontSize: 16),),
          const Expanded(child: SizedBox()),
          Stack(
          clipBehavior: Clip.none,
          children: [
          const Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 30),
          Positioned(
          right: -3,
          top: -5,
          child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          ),
          child: const Text(
          "3",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
          ),
          ],
          )
          ],
          ),
          ),
            const SizedBox(height: 20),
            const AppBanner(),
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
             ElectronicProduct product = getProduct(index);
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
  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

}
