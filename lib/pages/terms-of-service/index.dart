import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms of Service',
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
              'Terms of Service\n\n'
              'Welcome to GoalFit. By using our application, you agree to the following Terms of Service. '
              'Please read them carefully.\n\n'
              'Acceptance of Terms\n\n'
              'By accessing or using GoalFit, you agree to be bound by these terms. If you do not agree, '
              'please do not use the app.\n\n'
              'Use of the App\n\n'
              'GoalFit is provided to help you track fitness goals and progress. You agree to use the app '
              'lawfully and not misuse or attempt to disrupt its functionality.\n\n'
              'Accounts and Security\n\n'
              'You are responsible for maintaining the confidentiality of your account information and for '
              'all activity under your account.\n\n'
              'Content and Data\n\n'
              'You retain ownership of your content and data. By using the app, you grant GoalFit permission '
              'to process your data for providing and improving the service.\n\n'
              'Third-Party Services\n\n'
              'GoalFit may integrate third-party services (such as authentication or analytics). These services '
              'may have their own terms and policies.\n\n'
              'Disclaimer\n\n'
              'GoalFit is provided “as is” without warranties of any kind. Fitness results may vary, and the app '
              'does not replace professional medical advice.\n\n'
              'Limitation of Liability\n\n'
              'To the maximum extent permitted by law, GoalFit will not be liable for any indirect, incidental, '
              'or consequential damages arising from use of the app.\n\n'
              'Changes to These Terms\n\n'
              'We may update these Terms of Service from time to time. Changes will be reflected within the app.\n\n'
              'Contact Us\n\n'
              'If you have any questions about these Terms of Service, contact us at support@goalfit.app.',
              style: TextStyle(fontSize: 14, height: 1.6),
            ),
          ),
        ),
      ),
    );
  }
}
