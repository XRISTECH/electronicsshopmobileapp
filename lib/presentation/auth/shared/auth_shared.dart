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


Future<bool> uploadPic(WidgetRef ref, BuildContext context, XFile imageFile)async{
  final sMessenger = ScaffoldMessenger.of(context);
  final errorModel = await ref.read(authRepositoryProvider).updateProfilePic(imageFile: imageFile);
  if (errorModel.error == null  && errorModel.data != null) {
    sMessenger.showSnackBar(SnackBar(
      content: Text(errorModel.data, style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.green,
    ),
    );
    updateUserProvider(ref);
    return true;
  }else {
    sMessenger.showSnackBar(
      SnackBar(
        content: Text(errorModel.error!, style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }
}


void updateUserProvider(WidgetRef ref,)async{
  final authRepo = ref.watch(authRepositoryProvider);
  final errorModel = await authRepo.getUserData();

  if (errorModel.error == null && errorModel.data != null) {
    ref.read(userProvider.notifier).state = errorModel.data;
  }
}


