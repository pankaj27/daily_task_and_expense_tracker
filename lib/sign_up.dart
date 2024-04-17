import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Form submitted successfully')));
    }
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter email';
    }
    RegExp emailRegexp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegexp.hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? _validatePhone(value) {
    RegExp phoneRegex = RegExp(r'^(\+|00)?[0-9]+$');
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    } else if (!phoneRegex.hasMatch(value)) {
      return 'Please enter numeric value only';
    } else if (value.length != 10) {
      return 'Please enter 10 digit valid phone number';
    }
    return null;
  }

  String? _validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please enter  username';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter  password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF252634),
        body: Padding(
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
                    child: Text("Create new Account",
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
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildinputDecoration("Username", Icons.person),
                    validator: _validateUsername,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildinputDecoration("Email Id", Icons.email),
                    validator: _validateEmail,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        _buildinputDecoration("Phone number", Icons.call),
                    validator: _validatePhone,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildinputDecoration("Password", Icons.lock),
                    validator: _validatePassword,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 241, 89, 0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 5),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      child: const Text('Create',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 252, 226, 212),
                          fontSize: 20.0),
                    ),
                  )
                ],
              )),
        ));
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
