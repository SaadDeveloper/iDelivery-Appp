import 'package:flutter/material.dart';

import 'package:idelivery_app/src/features/onboarding/onboarding_page.dart';
import 'package:idelivery_app/src/screens/care_screen.dart';
import 'package:idelivery_app/src/screens/home_screen.dart';
import 'package:idelivery_app/src/screens/order_screen.dart';
import 'package:idelivery_app/src/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iDelivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //primarySwatch: Colors.deepPurple,
          ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: showHome ? HomePage() : OnboardingPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List screens = [
    HomeScreen(),
    OrderScreen(),
    CareScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedIconTheme: IconThemeData(color: Colors.purple),
          selectedItemColor: Colors.purple,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: 'Care',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            )
          ],
        ),
      ),
    );
  }
}
