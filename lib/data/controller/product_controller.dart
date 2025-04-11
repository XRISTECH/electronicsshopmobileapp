import 'package:electronicsshop_app/cores/app_exports.dart';


final productControllerProvider =
StateNotifierProvider<ProductController, ProductState>((ref) {
  final productRepo = ref.watch(productRepositoryProvider);
  return ProductController(ref: ref, productRepository: productRepo);
});

class ProductController extends StateNotifier<ProductState> {
  final Ref _ref;
  final ProductRepository _productRepository;
  late List<ProductModel> allProducts = [];
  List<ProductModel> get smartPhones => allProducts.where((product) => product.name == "Smartphone").toList();
  List<ProductModel> get fridges => allProducts.where((product) => product.name == "Fridge").toList();
  List<ProductModel> get airConditioners => allProducts.where((product) => product.name == "Air Conditioner").toList();
  List<ProductModel> get smartwatches => allProducts.where((product) => product.name == "Smartwatch").toList();
  List<ProductModel> get headphones => allProducts.where((product) => product.name == "Headphone").toList();
  List<ProductModel> get laptops => allProducts.where((product) => product.name == "Laptop").toList();
  List<ProductModel> get televisions => allProducts.where((product) => product.name == "Television").toList();


  ProductController({
    required Ref ref,
    required ProductRepository productRepository,
  })  : _ref = ref,
        _productRepository = productRepository,
        super(ProductState(isLoading: true, products: []));


  Future<void> fetchAllProducts() async {
    state = state.copyWith(isLoading: true);
    final res = await _productRepository.getAllProducts();

    if (res.error == null && res.data != null) {
      state = ProductState(
        isLoading: false,
        products: res.data as List<ProductModel>,
      );
      allProducts = state.products;
      print(state.products.toString());
      print(smartPhones);
    } else {
      // Optionally handle errors using a snackbar, logger, etc.
      debugPrint('Error fetching products: ${res.error}');
      state = state.copyWith(isLoading: false);
    }
  }
}
