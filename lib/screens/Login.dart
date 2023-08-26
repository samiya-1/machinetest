import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:machinetest/screens/product.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';

  Future<void> _login() async {
    final url = Uri.parse('https://37be-59-94-203-60.ngrok-free.app/api/login_users');
    final response = await http.post(
      url,
      body: jsonEncode({
        "key": "username",
        "value": _usernameController.text,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      // Assuming successful login returns a JSON response
      final responseData = jsonDecode(response.body);

      if (responseData['key'] == 'username' && responseData['value'] == _usernameController.text) {
        setState(() {
          _message = 'Login successful!';
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductListPage()));
        });
      } else {
        setState(() {
          _message = 'Invalid username or password.';
        });
      }
    } else {
      setState(() {
        _message = 'Failed to log in. Please try again later.';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            SizedBox(height: 16),
            Text(_message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}