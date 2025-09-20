import 'package:flutter/material.dart';
import 'package:birhmani_ai_ludo/config/gemini_config.dart';
// Note: google_generative_ai package calls are wrapped in try/catch to keep app stable when key absent.
import 'dart:async';
// Import is present but we will not fail if package internals differ at runtime.
import 'package:google_generative_ai/google_generative_ai.dart' show GoogleGenerativeAI;

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage(this.text, {this.isUser = true});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _thinking = false;
  GoogleGenerativeAI? _client;

  @override
  void initState() {
    super.initState();
    _initClient();
  }

  void _initClient() {
    // Initialize Gemini client only when a key is provided.
    try {
      if (GEMINI_API_KEY != 'YOUR_GEMINI_API_KEY_HERE') {
        _client = GoogleGenerativeAI(apiKey: GEMINI_API_KEY);
      } else {
        _client = null;
      }
    } catch (e) {
      _client = null;
    }
  }

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.insert(0, ChatMessage(text, isUser: true));
      _controller.clear();
      _thinking = true;
    });

    try {
      final prompt = "You are Utraadi Ludo assistant. Reply sassy, futuristic, and helpful. User: $text";
      if (_client == null) {
        // Mock response if no key
        await Future.delayed(const Duration(milliseconds: 800));
        setState(() {
          _messages.insert(0, ChatMessage("Mock AI: Add your Gemini API key in lib/config/gemini_config.dart to enable real responses. Tip: Bring tokens out on a 6!", isUser: false));
          _thinking = false;
        });
        return;
      }
      // Call Gemini safely
      final response = await _client!.generateText(prompt: prompt, maxOutputTokens: 256);
      final output = (response.candidates.isNotEmpty) ? response.candidates.first.output : "No response";
      setState(() {
        _messages.insert(0, ChatMessage(output, isUser: false));
        _thinking = false;
      });
    } catch (e) {
      setState(() {
        _messages.insert(0, ChatMessage("API Error: Check key/network. ($e)", isUser: false));
        _thinking = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Utraadi Ludo'), backgroundColor: Colors.transparent),
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF000000), Color(0xFF0A0A12)])),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final m = _messages[index];
                  return Align(
                    alignment: m.isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                      decoration: BoxDecoration(
                        color: m.isUser ? const Color(0xFF00FFFF).withOpacity(0.12) : Colors.white.withOpacity(0.06),
                        border: Border.all(color: m.isUser ? const Color(0xFF00FFFF) : const Color(0xFF8A2BE2)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(m.text, style: TextStyle(color: m.isUser ? const Color(0xFF00FFFF) : Colors.white)),
                    ),
                  );
                },
              ),
            ),
            if (_thinking) const Padding(padding: EdgeInsets.all(8), child: Text('Thinking...', style: TextStyle(color: Color(0xFF8A2BE2)))),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(hintText: 'Ask about Ludo...', hintStyle: TextStyle(color: Colors.white54)),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF00FFFF)),
                  onPressed: _send,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
