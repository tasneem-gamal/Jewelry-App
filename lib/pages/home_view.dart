import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/pages/cart_view.dart';
import 'package:store_app/pages/home_screen.dart';
import 'package:store_app/pages/profile_view.dart';
import 'package:store_app/pages/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'homePage';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const SearchView(),
    const CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("L'AZURDE"),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              setState(() {
                currentIndex = index;
              });
            },
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30,),
                label: 'Search'
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cartShopping),
                label: 'Cart'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30,),
                label: 'Profile'
              ),
            ]
          ),
    );
  }
}
