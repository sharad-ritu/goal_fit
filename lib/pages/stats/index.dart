import 'package:flutter/material.dart';

class ProfileStatsPage extends StatelessWidget {
  const ProfileStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistics")),
      body: const Center(child: Text("Profile → Statistics")),
    );
  }
}
