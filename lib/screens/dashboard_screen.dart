import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();

}
class _DashboardScreenState extends State<DashboardScreen>{
  var isLogoutLoading = false;
  logout() async {
    setState(() {

    });
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.exit_to_app))],
      ),
      body: const Text('Hello'),
    );
  }


}
