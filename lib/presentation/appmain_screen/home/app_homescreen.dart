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


  void signOut() {
    print("Signing out...");
    ref.read(authRepositoryProvider).signOut(ref);
    NavigatorService.popAndPushNamed(AppRoutes.wrapper);
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
          return  const CategoryAppBarList();
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
            const CategoryList(),
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
            return ProductsGrid(index: index);
          },
          childCount: smartphones.length,
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

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

}
