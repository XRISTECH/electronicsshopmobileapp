import 'package:electronicsshop_app/cores/app_exports.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.onSwitch});

  final Function onSwitch;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
        setState(() {
          _isScrollingDown = true;
        });
      }
    } else {
      if (_isScrollingDown) {
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                        (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Row(
                          children: [
                            Text(
                              filterCategory[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            Icon(
                              index == 0 ? Icons.filter_list : Icons.keyboard_arrow_down,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  if (_isScrollingDown)
                    SliverAppBar(
                      backgroundColor: Colors.black,
                      pinned: true,
                      floating: true,
                      automaticallyImplyLeading: false,
                      title: CategoryAppBarList(
                        onTap: (category) {
                          setState(() {
                            productCategory = category;
                          });
                        },
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CategoryList(
                          onTap: (category) {
                            setState(() {
                              productCategory = category;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          // ElectronicProduct product = getProduct(index);
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AppItemsDetails(product: product),
                              //   ),
                              // );
                            },
                            // child: ProductsGrid(product: product),
                          );
                        },
                        // childCount: getLength(),
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
            ),
          ],
        ),
      ),
    );
  }
}
