import 'package:flutter/material.dart';
import 'package:template/Dentist/HomePage/view/home_page.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomePage(
                      isPreviewMode: true,
                    ),
                  ),
                );
              },
              child: const Text("وضع الاطلاع"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomePage(
                      isPreviewMode: false,
                    ),
                  ),
                );
              },
              child: const Text("الوضع العادي"),
            ),
          ],
        ),
      ),
    );
  }
}
