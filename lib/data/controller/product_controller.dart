import 'package:electronicsshop_app/cores/app_exports.dart';


final productControllerProvider =
StateNotifierProvider<ProductController, ProductState>((ref) {
  final productRepo = ref.watch(productRepositoryProvider);
  return ProductController(ref: ref, productRepository: productRepo);
});

class ProductController extends StateNotifier<ProductState> {
  final Ref _ref;
  final ProductRepository _productRepository;

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
      print(state.products.toString());
    } else {
      // Optionally handle errors using a snackbar, logger, etc.
      debugPrint('Error fetching products: ${res.error}');
      state = state.copyWith(isLoading: false);
    }
  }
}
