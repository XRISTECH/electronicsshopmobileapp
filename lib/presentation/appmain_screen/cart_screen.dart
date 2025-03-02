import 'package:electronicsshop_app/cores/app_exports.dart';


class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          Column(
            children: cartProducts.map((p) {
              return Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Image.asset(
                      p.img,
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${p.name}...'),
                    const Expanded(child: SizedBox()),
                    Text('£${p.price}'),
                  ],
                ),
              );
            }).toList(),
          ),
          Center(child: Text('Total price - $total')),
        ]),
      ),
    );
  }
}
