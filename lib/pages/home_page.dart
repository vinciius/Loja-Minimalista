import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index controls the bottom navigation bar
  int _selectedIndex = 0;

  // this method updates the selected index
  // when user taps on the bottom bar
  void navigateBottomBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            children: [
              // logo
              DrawerHeader(child: Image.asset(
                'assets/images/nike.png',
                color: Colors.white,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(color: Colors.grey[800],
                ),
              ),

              // other pages
              const Padding(
                padding: EdgeInsets.only( left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white,),
                  title: Text(
                    'Home', 
                    style: TextStyle(
                      color: Colors.white),
                      ),
                ),
              ),
            ],
          ),
        ),
      body: _pages[_selectedIndex],
    );
  }
}