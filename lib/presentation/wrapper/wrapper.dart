import 'package:electronicsshop_app/cores/app_exports.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    print("Current user: ${user?.username}");
    return user == null ? const Authenticate() : const HomeController();
  }
}

