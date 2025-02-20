import 'package:flutter/material.dart';
import 'package:shell_route_2_0/core/routes/router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Profile'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => router.pushNamed(RouteNames.settings.name),
              child: Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
