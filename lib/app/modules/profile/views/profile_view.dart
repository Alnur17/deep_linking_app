import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final referId = Get.parameters['refId'];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Profile Screen',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          referId != null
              ? 'Refer ID: $referId'
              : 'Error: refId is required',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
