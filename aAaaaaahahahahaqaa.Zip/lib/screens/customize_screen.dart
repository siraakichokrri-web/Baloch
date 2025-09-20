import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});
  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  String tokenTheme = 'default';
  String diceSkin = 'default';

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final p = await SharedPreferences.getInstance();
    setState(() {
      tokenTheme = p.getString('token_theme') ?? 'default';
      diceSkin = p.getString('dice_skin') ?? 'default';
    });
  }

  Future<void> _savePrefs() async {
    final p = await SharedPreferences.getInstance();
    await p.setString('token_theme', tokenTheme);
    await p.setString('dice_skin', diceSkin);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customize')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Token Theme', style: TextStyle(color: Color(0xFF00FFFF), fontSize: 18)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(label: Text('Default'), selected: tokenTheme=='default', onSelected: (_) => setState(()=>tokenTheme='default')),
                ChoiceChip(label: Text('Alt Neon'), selected: tokenTheme=='alt', onSelected: (_) => setState(()=>tokenTheme='alt')),
              ],
            ),
            SizedBox(height: 16),
            Text('Dice Skin', style: TextStyle(color: Color(0xFF00FFFF), fontSize: 18)),
            SizedBox(height: 8),
            Wrap(spacing: 8, children: [
              ChoiceChip(label: Text('Default'), selected: diceSkin=='default', onSelected: (_) => setState(()=>diceSkin='default')),
              ChoiceChip(label: Text('Skin 2'), selected: diceSkin=='skin2', onSelected: (_) => setState(()=>diceSkin='skin2')),
            ]),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _savePrefs, child: Text('Save')),
          ],
        ),
      ),
    );
  }
}
