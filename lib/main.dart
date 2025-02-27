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
    return userAsync.when(
      data: (errorModel) {
        final user = errorModel.data;
        if (user != null) {
          ref.read(userProvider.notifier).state = user;
        }
        return MaterialApp(
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: user != null ? AppRoutes.wrapper : AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
      loading: () => const MaterialApp(
        home: Loading()
      ),
      error: (err, stack) => MaterialApp(
        home: Scaffold(
          body: Center(child: Text("Error: ${err.toString()}")),
        ),
      ),
    );
  }
}
