import 'package:electronicsshop_app/cores/app_exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
// initial value
  @override
  Set<ProductModel> build() {
    return {};
  }

// method to add product
  void addProduct(ProductModel product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

// method to remove product
  void removeProduct(ProductModel product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

}


// get total price of items in cart
@riverpod
double cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  double total = 0;
  for (ProductModel product in cartProducts) {
   total += product.price;
  }

  return total;
}


