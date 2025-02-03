import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  final Map<String, dynamic> profile;

  const AdminDashboard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Welcome Admin, ${profile['name']}'),
        ElevatedButton(
          onPressed: () {
            // Add admin-specific functionality here
            print('Admin dashboard functionality');
          },
          child: Text('Manage Users'),
        ),
        // Add more admin-specific features as needed
      ],
    );
  }
}
