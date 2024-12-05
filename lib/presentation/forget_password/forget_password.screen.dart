import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/forget_password.controller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPasswordScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgetPasswordScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
