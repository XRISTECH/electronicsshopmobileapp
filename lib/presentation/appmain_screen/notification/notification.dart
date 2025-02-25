import 'package:electronicsshop_app/cores/app_exports.dart';

class NotificationPage extends StatefulWidget {
  final Function onSwitch;
  const NotificationPage({super.key, required this.onSwitch});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
       child: Text("NOTIFICATION PAGE"),
      ),
    );
  }
}
