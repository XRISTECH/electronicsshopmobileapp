import 'package:electronicsshop_app/cores/app_exports.dart';



void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// Fetches user data on app start
final userDataProvider = FutureProvider.autoDispose((ref) async {
  final authRepo = ref.watch(authRepositoryProvider);
  final errorModel = await authRepo.getUserData();

  if (errorModel.error == null && errorModel.data != null) {
    ref.read(userProvider.notifier).state = errorModel.data;
  }

  return errorModel;
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userDataProvider);
    //  Listen for userData load, then fetch products
    ref.listen(userDataProvider, (previous, next) {
      next.whenData((errorModel) {
        final user = errorModel.data;
        if (user != null) {

          ref.read(userProvider.notifier).state = user;

          //  Fetch products safely after user loads
          ref.read(productControllerProvider.notifier).fetchAllProducts();
        }
      });
    });
    ref.watch(cartNotifierProvider);
    return userAsync.when(
      data: (errorModel) {
        final user = errorModel.data;
        return MaterialApp(
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: user != null ? AppRoutes.wrapper : AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
      loading: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Loading()
      ),
      error: (err, stack) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: Text("Error: ${err.toString()}")),
        ),
      ),
    );
  }
}
