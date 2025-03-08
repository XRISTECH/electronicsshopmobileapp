import 'package:electronicsshop_app/cores/app_exports.dart';

Future<bool> googleSignIn(WidgetRef ref, BuildContext context) async {
  final sMessenger = ScaffoldMessenger.of(context);
  final errorModel = await ref.read(authRepositoryProvider).signInWithGoogle();
  if (errorModel.error == null  && errorModel.data != null) {
    ref.read(userProvider.notifier).state = errorModel.data;
    return true;
  } else {
    sMessenger.showSnackBar(SnackBar(content: Text(errorModel.error!)));
    return false;
  }
}