import 'package:flutter/material.dart';
class Navbar extends StatelessWidget {
  const Navbar({super.key, required this.selectedIndex, required this.onDestinationSelected});
  final int selectedIndex ;
  final ValueChanged<int> onDestinationSelected ;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.blue.shade900,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 60,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home,color: Colors.white,),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.list),
          selectedIcon: Icon(Icons.list,color: Colors.white,),
          label: 'Transaction',
        ),

      ],
    );
  }
}
