import 'package:electronicsshop_app/cores/app_exports.dart';


class Profile extends ConsumerStatefulWidget {
  final Function onSwitch;
  const Profile({super.key, required this.onSwitch});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {

  void signOut() {
    ref.read(authRepositoryProvider).signOut(ref);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
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
    Stack(
      alignment: Alignment.bottomRight,
    children: [
    const Icon(Icons.person_pin, size: 100, color: Colors.white,),
    Positioned(
    child: Container(
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.pink,
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
    const SizedBox(height: 10),
    // Name & Email
    Text(user!.username, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
    Text(user.email, style: const TextStyle(color: Colors.grey)),
    const SizedBox(height: 20),

    // Profile Menu Options
    _buildProfileOption(Icons.shopping_bag, "My Orders"),
    _buildProfileOption(Icons.favorite, "Wishlist"),
    _buildProfileOption(Icons.credit_card, "Payment Methods"),
    _buildProfileOption(Icons.location_on, "Shipping Address"),
    _buildProfileOption(Icons.settings, "Settings"),

    const SizedBox(height: 20),
    // Logout Button
    ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    icon: const Icon(Icons.logout, color: Colors.white,),
    label: const Text("Logout"),
    onPressed: () {
      signOut();
    },
    ),

    ],
    ),
    ),
    );
  }

}


Widget _buildProfileOption(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, color: Colors.white,),
    title: Text(title, style: const TextStyle(color: Colors.white),),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white,),
    onTap: () {
      // Navigate to respective screen
    },
  );
}





