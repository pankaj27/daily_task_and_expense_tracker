import 'package:daily_task_and_expense_tracker/screens/home_screen.dart';
import 'package:daily_task_and_expense_tracker/screens/transaction_screen.dart';
import 'package:daily_task_and_expense_tracker/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daily_task_and_expense_tracker/screens/login_screen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

}
class _DashboardScreenState extends State<DashboardScreen>{
  var isLogoutLoading = false;
  int currentIndex =0 ;
  var pageViewlist = [HomeScreen(),TransactionScreen()];
  logout() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    setState(() {
      isLogoutLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Navbar(selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
        setState(() {
          currentIndex = value;
        });
        },),
      body: pageViewlist[currentIndex],
    );
  }


}
