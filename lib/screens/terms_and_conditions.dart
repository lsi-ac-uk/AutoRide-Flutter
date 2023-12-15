import 'package:flutter/material.dart';

import '../res/color_manager.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: Container(
        color: ColorManager.mainBackGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              Text(
                '1. Introduction',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Welcome to the Cab Sharing App. By using our app, you agree to abide by the terms and conditions outlined below.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '2. Usage Guidelines',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'a. Users must be at least 18 years old to use the app.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'b. Users are responsible for their conduct and content while using the app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '3. Privacy Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Please review our Privacy Policy to understand how we collect and use your information.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '4. Changes to Terms and Conditions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We reserve the right to update or change these terms and conditions at any time. Please check this page periodically for changes.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
