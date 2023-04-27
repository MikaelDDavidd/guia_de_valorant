import 'package:flutter/material.dart';
import 'package:guia_de_valorant/utils/routes/routes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {Key? key,
      required int currentIndex,
      required Null Function(int index) onTap})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.home);
        break;
      case 1:
        Navigator.pushNamed(context, Routes.agents);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.weapons);
        break;
      case 3:
        Navigator.pushNamed(context, Routes.maps);
        break;
      case 4:
        Navigator.pushNamed(context, Routes.skins);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Agents',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.extension),
          label: 'Weapons',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Maps',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.color_lens),
          label: 'Skins',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
    );
  }
}
