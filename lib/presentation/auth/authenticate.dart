import 'package:electronicsshop_app/cores/app_exports.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
      if(showSignIn){
        return ElectronicsShopLogin(toggleView: toggleView,);
      }else{
        return ElectronicsAppSignup(toggleView: toggleView,);
      }
  }
}
