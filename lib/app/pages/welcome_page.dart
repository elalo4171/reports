import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeIn(
              delay: const Duration(milliseconds: 500),
              child: const Text(
                "Welcome\nTo\nReports",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 80),
            FadeIn(
              delay: const Duration(milliseconds: 1000),
              child: IconButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, 'home');
                },
                icon: const Icon(
                  Icons.arrow_right,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
