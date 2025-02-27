import 'package:electronicsshop_app/cores/app_exports.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

void checkAuthentication() async {
    final authRepo = ref.read(authRepositoryProvider);
    final errorModel = await authRepo.getUserData();
    print(errorModel.data);
    if (errorModel.error == null && errorModel.data != null) {
      ref.read(userProvider.notifier).state = errorModel.data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: NavigatorService.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes
    );
  }
}




