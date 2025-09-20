import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int wins = 0;
  int losses = 0;
  int games = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      wins = prefs.getInt('stat_wins') ?? 0;
      losses = prefs.getInt('stat_losses') ?? 0;
      games = prefs.getInt('stat_games') ?? 0;
    });
  }

  Future<void> _resetStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('stat_wins', 0);
    await prefs.setInt('stat_losses', 0);
    await prefs.setInt('stat_games', 0);
    _loadStats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile & Stats')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 36, backgroundColor: Color(0xFF00FFFF), child: Icon(Icons.person, size: 36, color: Colors.black)),
            SizedBox(height: 12),
            Text('Player', style: TextStyle(color: Color(0xFF00FFFF), fontSize: 20)),
            SizedBox(height: 20),
            Card(
              color: Colors.black54,
              child: ListTile(
                title: Text('Wins', style: TextStyle(color: Colors.white)),
                trailing: Text('\$wins', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 8),
            Card(
              color: Colors.black54,
              child: ListTile(
                title: Text('Losses', style: TextStyle(color: Colors.white)),
                trailing: Text('\$losses', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 8),
            Card(
              color: Colors.black54,
              child: ListTile(
                title: Text('Games Played', style: TextStyle(color: Colors.white)),
                trailing: Text('\$games', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _resetStats,
              style: ElevatedButton.styleFrom(side: BorderSide(color: Color(0xFF8A2BE2))),
              child: Text('Reset Stats'),
            )
          ],
        ),
      ),
    );
  }
}
