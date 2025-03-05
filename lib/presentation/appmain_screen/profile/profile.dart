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
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.black,
    ),
    body: SingleChildScrollView(
    child: Column(
    children: [
    const SizedBox(height: 20),
    // Profile Picture
    Center(
    child: Stack(
    children: [
    const CircleAvatar(
    radius: 60,
    backgroundImage: AssetImage('assets/mypicture.jpeg'), // Replace with NetworkImage for online images
    ),
    Positioned(
    bottom: 5,
    right: 5,
    child: Container(
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue,
    ),
    child: IconButton(
    icon: const Icon(Icons.edit, color: Colors.white, size: 18),
    onPressed: () {

    },
    ),
    ),
    ),
    ],
    ),
    ),
    const SizedBox(height: 10),
    // Name & Email
    const Text("John Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    const Text("johndoe@example.com", style: TextStyle(color: Colors.grey)),
    const SizedBox(height: 20),

    // Profile Menu Options
    _buildProfileOption(Icons.shopping_bag, "My Orders"),
    _buildProfileOption(Icons.favorite, "Wishlist"),
    _buildProfileOption(Icons.credit_card, "Payment Methods"),
    _buildProfileOption(Icons.location_on, "Shipping Address"),
    _buildProfileOption(Icons.settings, "Settings"),



    const SizedBox(height: 20),
    // Logout Button
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    icon: const Icon(Icons.logout),
    label: const Text("Logout"),
    onPressed: () {},
    ),
    ),

    const SizedBox(height: 20),
    ],
    ),
    ),
    );
  }
}
Widget _buildProfileOption(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () {
      // Navigate to respective screen
    },
  );
}





