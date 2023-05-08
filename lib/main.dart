import 'package:bottomnavigation/pages/fav_screen.dart';
import 'package:bottomnavigation/pages/home_screen.dart';
import 'package:bottomnavigation/pages/search_screen.dart';
import 'package:bottomnavigation/pages/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavouriteScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
          child: GNav(
            gap: 5,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            padding: EdgeInsets.all(16),
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(icon: Icons.home,text: 'Home',),
              GButton(icon: Icons.favorite_border,text: 'Likes',),
              GButton(icon: Icons.search,text: 'Search',),
              GButton(icon: Icons.settings,text: 'Settings')
            ],
          ),
        ),
      ),
    );
  }
}
