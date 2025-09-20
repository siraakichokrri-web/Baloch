import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'ludo_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Birhmani AI",
                style: TextStyle(fontSize: 28, color: Color(0xFF00FFFF))),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LudoScreen())),
              child: const Text("Ludo"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ChatScreen())),
              child: const Text("AI Bot Chat"),
            )
          ],
        ),
      ),
    );
  }
}
