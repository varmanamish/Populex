import 'package:flutter/material.dart';
import 'package:vivi25/api_service.dart';
import 'package:vivi25/pages/main_page.dart';
import 'package:vivi25/auth/login_page.dart';
import '../models/law_user_model.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _collegeController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _yearController = TextEditingController();
  final _fieldController = TextEditingController();

  bool _isLawStudent = false;
  bool _isLoading = false;

  final ApiService _apiService = ApiService();

  void _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    final user = LawUser(
      fullName: _fullNameController.text,
      phone: _phoneController.text,
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      isLawStudent: _isLawStudent,
      collegeName: _isLawStudent ? _collegeController.text : null,
      studentId: _isLawStudent ? _studentIdController.text : null,
      yearOfStudy: _isLawStudent ? _yearController.text : null,
      fieldOfInterest: _isLawStudent ? _fieldController.text : null,
    );

    setState(() => _isLoading = true);
    final result = await _apiService.register(user);
    setState(() => _isLoading = false);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(result['message'])));

    if (result['success']) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Text(
                'Register',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text("Are you a law student?"),
                  SizedBox(width: 12),
                  Radio<bool>(
                    value: true,
                    groupValue: _isLawStudent,
                    onChanged: (val) => setState(() => _isLawStudent = true),
                  ),
                  Text("Yes"),
                  Radio<bool>(
                    value: false,
                    groupValue: _isLawStudent,
                    onChanged: (val) => setState(() => _isLawStudent = false),
                  ),
                  Text("No"),
                ],
              ),
              if (_isLawStudent) ...[
                TextField(
                  controller: _collegeController,
                  decoration: InputDecoration(
                    labelText: "University/College Name",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _studentIdController,
                  decoration: InputDecoration(
                    labelText: "Student ID / Roll Number",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _yearController,
                  decoration: InputDecoration(
                    labelText: "Year of Study",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _fieldController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Field of Interest (e.g., Constitutional Law)",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                  ),
                ),
              ],
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator(color: Colors.green)
                  : ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text("Register", style: TextStyle(fontSize: 18)),
                    ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                ),
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.green[700]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
