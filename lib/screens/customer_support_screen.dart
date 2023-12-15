import 'package:autoride/res/color_manager.dart';
import 'package:flutter/material.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainBackGroundColor,
      appBar: AppBar(
        title: const Text('Customer Support'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Contact Us'),
              subtitle: const Text('Get in touch with our support team'),
              leading: const Icon(Icons.mail),
              onTap: () {
                // Add logic to navigate to contact screen
                // For simplicity, we'll just print a message for now
                print('Navigate to Contact Us');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('FAQs'),
              subtitle: const Text('Commonly asked questions and answers'),
              leading: const Icon(Icons.question_answer),
              onTap: () {
                // Add logic to navigate to FAQs screen
                // For simplicity, we'll just print a message for now
                print('Navigate to FAQs');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Report an Issue'),
              subtitle: const Text('Submit a report for any issues you encounter'),
              leading: const Icon(Icons.report),
              onTap: () {
                // Add logic to navigate to report issue screen
                // For simplicity, we'll just print a message for now
                print('Navigate to Report an Issue');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Feedback'),
              subtitle: const Text('Share your feedback about the app'),
              leading: const Icon(Icons.feedback),
              onTap: () {
                // Add logic to navigate to feedback screen
                // For simplicity, we'll just print a message for now
                print('Navigate to Feedback');
              },
            ),
          ],
        ),
      ),
    );
  }
}