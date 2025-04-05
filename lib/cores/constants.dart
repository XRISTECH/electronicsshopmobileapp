import 'package:electronicsshop_app/cores/app_exports.dart';

const host = 'https://e-store-api-57kb.onrender.com';
// const host = 'http://192.168.43.165:3500';

var textInputDecoration = InputDecoration(
  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
  fillColor: Colors.transparent,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide:
        BorderSide(color: Colors.grey[400]!), // Set the default border color
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.black),
  ),
);

var inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: Colors.grey[400]!),
);





// class ProductListView extends ConsumerWidget {
//   const ProductListView({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productState = ref.watch(productControllerProvider);
//
//     if (productState.isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//
//     final products = productState.products;
//
//     return products.isEmpty
//         ? const Center(child: Text('No products available'))
//         : ListView.builder(
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return ProductTile(product: product);
//       },
//     );
//   }
// }