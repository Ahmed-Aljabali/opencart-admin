
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialog extends StatelessWidget {
  const Dialog({Key? key}) : super(key: key);

  void openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Dialog'),
        content: const Text('This is a dialog'),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dialog example'),
            OutlinedButton(
              onPressed: openDialog,
              child: const Text('Open'),
            )
          ],
        ),
      ),
    );
  }
}