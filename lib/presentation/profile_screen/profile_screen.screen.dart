import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile_screen.controller.dart';

class ProfileScreenScreen extends GetView<ProfileScreenController> {
  const ProfileScreenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileScreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
