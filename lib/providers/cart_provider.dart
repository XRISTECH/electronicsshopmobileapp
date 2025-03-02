import 'package:electronicsshop_app/cores/app_exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
// initial value
  @override
  Set<ElectronicProduct> build() {
    return {};
  }

// method to add product
  void addProduct(ElectronicProduct product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

// method to remove product
  void removeProduct(ElectronicProduct product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

}


// get total price of items in cart
@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (ElectronicProduct product in cartProducts) {
   total += int.tryParse(product.price) ?? 0;
  }

  return total;
}


