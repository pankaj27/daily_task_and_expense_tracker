import 'package:daily_task_and_expense_tracker/screens/sign_up.dart';
import 'package:daily_task_and_expense_tracker/utils/appvalidator.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var authService = AuthServices();
  var isLoader = false ;

  Future<void> _loginsubmitForm() async {
    if (_formKey.currentState!.validate()) {
      // ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
      //     const SnackBar(content: Text('Form submitted successfully')));

      setState((){
        isLoader =true;
      });

      var data = {
        "email" : _emailController.text,
        "password":_passwordController.text
      };

      await authService.login(data, context);

      setState((){
        isLoader =false;
      });


    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF252634),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  const SizedBox(
                    width: 250,
                    child: Text("Login Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildinputDecoration("Email", Icons.person),
                    validator: appValidator.validateEmail,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  
                  
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildinputDecoration("Password", Icons.lock),
                    validator: appValidator.validatePassword,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 241, 89, 0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: (){
                        isLoader? print("Loading") : _loginsubmitForm() ;
                      },
                      child: isLoader? const Center(child: CircularProgressIndicator()) : const Text('Login',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: const Text(
                      'Create new account',
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 226, 212),
                          fontSize: 20.0),
                    ),
                  )
                ],
              )),
        )));
  }

  InputDecoration _buildinputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: const Color(0xAA494A59),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0X35949494))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0X35949494))),
      filled: true,
      labelStyle: const TextStyle(color: Color(0xFF949494)),
      labelText: label,
      suffixIcon: Icon(suffixIcon, color: const Color(0xFF949494)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }


}
