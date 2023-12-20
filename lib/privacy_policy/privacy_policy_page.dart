import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Last Updated: January 1, 2023',
                style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16.0),
              // Add your privacy policy content here
              Text(
                'This is where you provide detailed information about how user data is collected, used, and protected in your app. Include sections such as:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              // Include sections such as data collection, use, protection, third-party services, etc.
              // Customize the content based on your app's features and functionalities.

              // Example:
              Text(
                '1. Data Collection',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'We collect no information such as email or phone no. etc',
                style: TextStyle(fontSize: 16.0),
              ),
              // Add more sections as needed

              // Example:
              Text(
                '2. Data Use',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'We use collected data for no purpose.',
                style: TextStyle(fontSize: 16.0),
              ),
              // Add more sections as needed

              // Include other relevant sections based on your app

              SizedBox(height: 16.0),
              Text(
                'For reading the privacy policy in detail, Please visit our privacy policy page',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'If you have any questions about this Privacy Policy, please contact us at your@email.com.',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}