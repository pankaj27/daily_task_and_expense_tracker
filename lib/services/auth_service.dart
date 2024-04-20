import 'package:firebase_auth/firebase_auth.dart';
import 'package:daily_task_and_expense_tracker/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class AuthServices{

  createUser(data, context) async {

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );


      
    } catch (e) {
      showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text('Sign up failed'),
            content: Text(e.toString()),
          );
      });
    }
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'],
          password: data['password']
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );

    }catch (e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Login error'),
          content: Text(e.toString()),
        );
      });
    }
  }
}