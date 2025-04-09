import 'package:flutter/material.dart';
import 'package:vivi25/api_service.dart';
import 'package:vivi25/auth/register_page.dart';
import 'package:vivi25/pages/home_page.dart';
import 'package:vivi25/pages/main_page.dart'; // Adjust path if needed

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });

    String input = _emailOrUsernameController.text.trim();
    String password = _passwordController.text.trim();

    Map<String, dynamic> result = await _apiService.login(input, password);

    setState(() {
      _isLoading = false;
    });

    if (result['success']) {
      // Navigate to home/dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
      // Navigator.pushReplacement(...);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['message'] ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailOrUsernameController,
                decoration: InputDecoration(
                  labelText: 'Email or Username',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 30),
              _isLoading
                  ? CircularProgressIndicator(color: Colors.green)
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text('Login',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                ),
                child: Text(
                  'Don’t have an account? Register',
                  style: TextStyle(color: Colors.green[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
