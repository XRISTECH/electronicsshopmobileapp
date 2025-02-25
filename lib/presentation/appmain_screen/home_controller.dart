import 'package:electronicsshop_app/cores/app_exports.dart';

// HomeController is a stateful widget that manages the home screen of the app
class HomeController extends StatefulWidget {
  const HomeController({super.key});

  @override
  State<HomeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  // Keeps track of the selected index for navigation
  late int _selectedIndex = 0;

  // PageController helps in managing the navigation between different pages using PageView
  final PageController _pageController = PageController();

  // This method switches between pages when a navigation item is tapped
  void _onSwitch(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
    _pageController.jumpToPage(index); // Navigate to the selected page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController, // Connects PageView to the controller
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; // Updates the selected index when swiping pages
          });
        },
        children: [
          // List of screens that will be displayed based on navigation selection
          AppHomeScreen(onSwitch: _onSwitch),
          Search(onSwitch: _onSwitch),
          NotificationPage(onSwitch: _onSwitch),
          Profile(onSwitch: _onSwitch)
        ],
      ),

      // Bottom Navigation Bar to switch between different screens
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black, // Set background color of the navigation bar
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black, // Background color of bottom navigation bar
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30, // Icon size
              ),
              label: 'Home', // Label for Home
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: 'Search', // Label for Search
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: 'Notification', // Label for Notifications
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                size: 30,
              ),
              label: 'Profile', // Label for Profile
            ),
          ],
          currentIndex: _selectedIndex, // Highlights the selected tab
          unselectedItemColor: Colors.grey[500], // Color for unselected icons
          showUnselectedLabels: true, // Show labels for unselected items
          selectedItemColor: Colors.pink, // Color for the selected icon
          onTap: _onSwitch, // Calls _onSwitch when an item is tapped
        ),
      ),
    );
  }
}
