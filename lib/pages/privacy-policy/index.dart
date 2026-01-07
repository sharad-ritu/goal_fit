import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE9E4E4),
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Privacy Policy\n\n'
              'GoalFit respects your privacy and is committed to protecting your personal data. '
              'This Privacy Policy explains how we collect, use, and safeguard your information '
              'when you use our application.\n\n'
              'Information We Collect\n\n'
              'We may collect basic information such as your name, email address, fitness goals, '
              'and usage data to help improve your experience. We do not collect sensitive personal '
              'information unless explicitly required and provided by you.\n\n'
              'How We Use Your Information\n\n'
              'Your information is used to personalize your fitness experience, track progress, '
              'improve app functionality, and provide customer support. We do not sell or rent '
              'your personal data to third parties.\n\n'
              'Data Security\n\n'
              'We take reasonable measures to protect your information from unauthorized access, '
              'alteration, or disclosure. However, no digital platform can guarantee complete security.\n\n'
              'Third-Party Services\n\n'
              'GoalFit may use third-party services (such as analytics or cloud storage) that follow '
              'their own privacy policies. We encourage you to review those policies.\n\n'
              'Your Rights\n\n'
              'You have the right to access, update, or delete your personal data. If you have any '
              'concerns about your data, you can contact us for assistance.\n\n'
              'Changes to This Policy\n\n'
              'We may update this Privacy Policy from time to time. Any changes will be reflected '
              'within the app.\n\n'
              'Contact Us\n\n'
              'If you have any questions or concerns about this Privacy Policy, please contact us '
              'at support@goalfit.app.',
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
          ),
        ),
      ),
    );
  }
}
