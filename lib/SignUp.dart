import 'package:flutter/material.dart';
import 'package:week2/Login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color(0xFF0B6E4F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First Name',
              style: TextStyle(fontSize: 16),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your first name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Last Name',
              style: TextStyle(fontSize: 16),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your last name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16),
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Address',
              style: TextStyle(fontSize: 16),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your address',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact',
              style: TextStyle(fontSize: 16),
            ),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your contact number',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Sign Up'),
              style: ElevatedButton.styleFrom(

                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already registered? '),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
