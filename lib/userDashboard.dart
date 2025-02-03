import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  final Map<String, dynamic> profile;

  const UserDashboard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Welcome ${profile['name']}'),
        ElevatedButton(
          onPressed: () {
            // Add user-specific functionality here
            print('User dashboard functionality');
          },
          child: Text('View Orders'),
        ),
        // Add more user-specific features as needed
      ],
    );
  }
}
