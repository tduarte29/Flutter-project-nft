import 'package:flutter/material.dart';
import 'package:nft_project/pages/welcome_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // final List<Widget> _pages = const [
  //   Center(child: Text('Home')),
  //   Center(child: Text('Business')),
  //   Center(child: Text('School')),
  //   Center(child: Text('Profile')),
  // ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomePage()),
            );
          },
          child: Text(
            'Home',
            // style: TextStyle(
            //   fontSize: 24,
            //   color: Colors.white,
            //   decoration: TextDecoration.underline,
            // ),
          ),
        ),
      ),
      Center(child: Text('Business')),
      Center(child: Text('School')),
      Center(child: Text('Profile')),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      backgroundColor: Color.fromARGB(255, 37, 51, 65),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon((Icons.signal_cellular_alt)),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 29, 155, 240),
        backgroundColor: Color.fromARGB(255, 22, 24, 28),
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
