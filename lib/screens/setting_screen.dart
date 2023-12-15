
import 'package:autoride/res/color_manager.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackGroundColor,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Notification Settings'),
              subtitle: const Text('Enable or disable notifications'),
              leading: const Icon(Icons.notifications),
              onTap: () {
                // Add logic to navigate to notification settings
                // For simplicity, we'll just print a message for now
                print('Navigate to Notification Settings');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Account Settings'),
              subtitle: const Text('Manage your account details'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                // Add logic to navigate to account settings
                // For simplicity, we'll just print a message for now
                print('Navigate to Account Settings');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Privacy Settings'),
              subtitle: const Text('Configure your privacy preferences'),
              leading: const Icon(Icons.lock),
              onTap: () {
                // Add logic to navigate to privacy settings
                // For simplicity, we'll just print a message for now
                print('Navigate to Privacy Settings');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('About'),
              subtitle: const Text('Learn more about the app'),
              leading: const Icon(Icons.info),
              onTap: () {
                // Add logic to navigate to about screen
                // For simplicity, we'll just print a message for now
                print('Navigate to About Screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
