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
            Navigator.pushNamed(context, '/battery');
          },
          child: Text("Check Battery Status"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/camera');
          },
          child: Text("Camera sensor"),
        ),
        // Add more user-specific features as needed
      ],
    );
  }
}
