import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Dummy login
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("AquaZen Login", style: TextStyle(fontSize: 24)),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
