import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) => setState(() => navDrawerIndex = value),
      children: [
        NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text('Home'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text('Buttons'),
        ),
    ],);
  }
}