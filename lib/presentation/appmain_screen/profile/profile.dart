import 'package:electronicsshop_app/cores/app_exports.dart';

class Profile extends StatefulWidget {
  final Function onSwitch;
  const Profile({super.key, required this.onSwitch});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("PROFILE PAGE"),
      ),
    );
  }
}


