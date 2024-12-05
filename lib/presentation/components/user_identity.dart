import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../register/controllers/register.controller.dart';
import '../register/register.screen.dart';

void main() async{
  runApp(Start());
}

class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return UserIdentityCard();
  }

}

class UserIdentityCard extends StatefulWidget {
  const UserIdentityCard({super.key});

  @override
  State<UserIdentityCard> createState() => _UserIdentityCardState();
}

class _UserIdentityCardState extends State<UserIdentityCard> {
  String _copiedText = "Your Unique Code";
  bool _isCopied = false;

  void _copyText() {
    Clipboard.setData(ClipboardData(text: _copiedText)).then((_) {
      setState(() {
        _isCopied = true;
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isCopied = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Identity Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Placeholder
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            // User Information
            const Text(
              "Name: John Doe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "ID: 12345678",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Copiable Text
            GestureDetector(
              onTap: _copyText,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: _isCopied ? Colors.green : Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _isCopied ? "Copied!" : "Copy Code",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
