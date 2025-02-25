import 'package:electronicsshop_app/cores/app_exports.dart';

class Search extends StatefulWidget {
  final Function onSwitch;
  const Search({super.key, required this.onSwitch});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SEARCH PAGE"),
      ),
    );
  }
}
