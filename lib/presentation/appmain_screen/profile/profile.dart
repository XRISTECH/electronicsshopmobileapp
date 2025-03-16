import 'package:electronicsshop_app/cores/app_exports.dart';


class Profile extends ConsumerStatefulWidget {
  final Function onSwitch;
  const Profile({super.key, required this.onSwitch});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  XFile? _pickedImage;
  bool loading = false;

  void signOut() {
    ref.read(authRepositoryProvider).signOut(ref);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
   bool hasProfilePic = user?.profilePic != '';
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
    loading ? Image.asset(ImageConstants.loader, width: 100, height: 100) : Stack(
      alignment: Alignment.bottomRight,
    children: [
    hasProfilePic
    ? CircleAvatar(
    backgroundColor: Colors.black,
      radius: 50,
      backgroundImage: NetworkImage(user!.profilePic),
      child: ClipOval(
        child: Image.network(
          user!.profilePic,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return  Center(
              child: Image.asset(ImageConstants.loader, width: 100, height: 100)
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, color: Colors.red, size: 50);
          },
        ),
      ),
    )
          : const CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 50,
      child: Icon(Icons.person, size: 50, color: Colors.white),
    ),

        Positioned(
    child: IconButton(
      style: IconButton.styleFrom(backgroundColor: Colors.pink),
    icon: const Icon(Icons.edit, color: Colors.white, size: 18),
    onPressed: () async{
      bool uploadSuccessful;
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          loading = true;
          _pickedImage = pickedImage;
        }
        );
        uploadSuccessful = await uploadPic(ref, context, _pickedImage!);
        if(uploadSuccessful || !uploadSuccessful){
          setState(() {
            loading = false;
          });
        }
      }
    },
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





