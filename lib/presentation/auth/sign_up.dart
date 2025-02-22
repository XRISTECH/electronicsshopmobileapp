import 'package:electronicsshop_app/cores/app_exports.dart';

class ElectronicsAppSignup extends StatefulWidget {
  final Function toggleView;
  const ElectronicsAppSignup({super.key, required this.toggleView});

  @override
  State<ElectronicsAppSignup> createState() => _ElectronicsAppSignupState();
}

class _ElectronicsAppSignupState extends State<ElectronicsAppSignup> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(child: Image.asset(ImageConstants.camImg, width: 100, height: 100)),
          ),
          ElevatedButton(onPressed: (){
            widget.toggleView();
          }, child:  Text("login"))
        ],
      )
    );
  }
}
