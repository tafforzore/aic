import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile_scree.controller.dart';

class ProfileScreeScreen extends GetView<ProfileScreeController> {
  const ProfileScreeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileScreeScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileScreeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
