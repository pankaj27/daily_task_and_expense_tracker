import 'package:daily_task_and_expense_tracker/screens/dashboard_screen.dart';
import 'package:daily_task_and_expense_tracker/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return LoginScreen();
          }
            return DashboardScreen();
        });
  }
}
